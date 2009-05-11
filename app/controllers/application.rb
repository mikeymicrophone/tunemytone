class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :load_user_into_ar
  before_filter :prefix_params, :only => [:new, :create]
  before_filter :load_scope_object, :only => [:show, :edit, :update, :destroy]

  private
    def load_scope_object
      @scope_object = send_to_model(:find, params[:id])
      instance_variable_set('@' + controller_name.singularize, @scope_object)
    end
    
    def send_to_model *args
      controller_name.classify.constantize.send *args
    end
  
    def prefix_params
      ids = params.select { |k, v| k =~ /_id/ }
      ids.reject { |k, v| k =~ /#{controller_name}/ } # shouldn't hit anyway because this is only for the new and create actions
      params[controller_name.singularize] ||= {}
      model = controller_name.singularize.camelize.constantize
      ids.each do |k, v|
        if model.new.respond_to?(k)
          params[controller_name.singularize][k] = v
        else
          params[controller_name.singularize]["#{polymorphic_attribute(controller_name)}_id"] = v
          k =~ /(\w+)_id/
          params[controller_name.singularize]["#{polymorphic_attribute(controller_name)}_type"] = $1.camelize
        end
      end
    end
    
    def polymorphic_attribute obj
      case obj
      when 'albums', 'shows'
        'performer'
      when 'elements'
        'specification'
      when 'excerpts'
        'context'
      when 'inputs', 'knobs', 'outputs'
        'host'
      when 'participations'
        'duration'
      when 'sounds'
        'example'
      else 
        'target'
      end
    end
  
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def load_user_into_ar
      ActiveRecord::Base.instance_variable_set('@current_user', current_user)
    end
end

class ActiveRecord::Base
  def self.scope_down controller, parameters, *associated_ids#, transitive_ids = {}
    set = nil
    associated_ids.each do |c|
      if set.nil? && parameters["#{c}_id"]
        scope_object = c.camelize.constantize.send(:find, parameters["#{c}_id"])
        controller.instance_variable_set("@#{c}", scope_object)
        controller.instance_variable_set("@scope_object", scope_object)
        set = scope_object.send(self.name.underscore.pluralize)
      end
    end
    transitive_ids = {} # not correctly implemented yet
    set || transitive_ids.each do |k, v|
      v.each do |c|
        if set.nil? && parameters["#{c}_id"]
          scope_object = c.camelize.constantize.send(:find, parameters["#{c}_id"])
          controller.instance_variable_set("@#{c}", scope_object)
          controller.instance_variable_set("@scope_object", scope_object)
          set = scope_object.send(k).send(c).map(&:target)
        end
      end
    end
    
    return set || all
  end
  
  def current_user_id
    current_user.id if current_user
  end
  
  def current_user
    @current_user ||= ActiveRecord::Base.instance_variable_get('@current_user')
  end
  
  def credit_creator
    self.user ||= current_user if respond_to?(:user=)
  end
  before_create :credit_creator
  
  def self.map_name_and_id
    all.map { |a| txt = (a.name.blank? ? a.other_name : a.name); [txt, a.id] }
  end
  
  def other_name
    self.class.name.underscore + id.to_s
  end
end