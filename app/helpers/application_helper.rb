# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def back_link
    link_to_function 'back', 'history.go(-1)'
  end
  
  def edit_link obj
    return unless obj.user == ActiveRecord::Base.instance_variable_get('@current_user')
    link_to 'edit', send("edit_#{obj.class.name.underscore}_path", obj)
  end
  
  def link_to_name obj
    return if obj.nil?
    text = obj.name.blank? ? obj.other_name : obj.name
    link_to text, obj
  end
  
  def link_to_each obj, *collections
    collections.map do |collection|
      collection_link = scoped_collection_link(collection, obj) rescue nil
      content_tag(:ul, obj.send(collection).map do |record|
        content_tag(:li, link_to_name(record))
      end.unshift(collection_link).join)
    end.join
  end
  
  def new_links obj, *children
    children.map do |child|
      content_tag(:span, link_to("new #{child}", send("new_#{obj.class.name.underscore}_#{child}_path", obj)))
    end.join
  end
  
  def scoped_new_link target
    target = target.to_s
    unless @scope_object
      link_to 'new ' + target, send("new_#{target}_path")
    else
      name = @scope_object.name.blank? ? @scope_object.other_name : @scope_object.name
      link_to "new #{target} for #{name}", send("new_#{@scope_object.class.name.underscore}_#{target}_path", @scope_object)
    end
  end
  
  def collection_path obj
    controller.send collection(obj) + '_path'
  end
  
  def scoped_collection_path obj, scope_object = nil
    return collection_path obj unless scope_object
    controller.send scope_object.class.name.underscore + '_' + collection(obj) + '_path', scope_object
  end
  
  def collection_link obj
    link_to collection(obj), collection_path(obj)
  end
  
  def scoped_collection_link obj, scope_object = nil
    unless scope_object
      collection_link collection(obj)
    else
      begin
        count = scope_object.send(collection(obj)).count
      rescue NoMethodError
        count = scope_object.send(collection(obj)).length
      end
      name = scope_object.name.blank? ? scope_object.other_name : scope_object.name
      link_to "#{pluralize(count, collection(obj).singularize)} for #{name}", scoped_collection_path(obj, scope_object)
    end
  end
  
  def collection obj
    if obj.is_a? String
      obj
    elsif obj.is_a? Symbol
      obj.to_s
    else
      obj.class.name.underscore
    end.pluralize
  end
  
  def login_stuff
    if current_user
      link_to 'log out', logout_path
    else
      link_to('sign up', signup_path) + link_to('log in', login_path)
    end
  end
end
