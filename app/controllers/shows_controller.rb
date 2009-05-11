class ShowsController < ApplicationController
  def index
    @shows = Show.scope_down(self, params, 'band', 'artist', 'venue')

    respond_to do |format|
      format.html
      format.xml  { render :xml => @shows }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @show }
    end
  end

  def new
    if params[:artist_id]
      params[:show][:performer_type] = 'Artist'
      params[:show][:performer_id] = params[:artist_id]
    elsif params[:band_id]
      params[:show][:performer_type] = 'Band'
      params[:show][:performer_id] = params[:band_id]
    end
    @show = Show.new params[:show]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @show }
    end
  end

  def create
    @show = Show.new params[:show]

    respond_to do |format|
      if @show.save
        flash[:notice] = 'Show was successfully created.'
        format.html { redirect_to @show }
        format.xml  { render :xml => @show, :status => :created, :location => @show }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @show.update_attributes params[:show]
        flash[:notice] = 'Show was successfully updated.'
        format.html { redirect_to @show }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url }
      format.xml  { head :ok }
    end
  end
end
