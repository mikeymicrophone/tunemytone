class AlbumsController < ApplicationController
  def index
    @albums = Album.scope_down(self, params, 'band', 'artist')

    respond_to do |format|
      format.html
      format.xml  { render :xml => @albums }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @album }
    end
  end

  def new
    params[:album] ||= {}
    params[:album][:performer_id], params[:album][:performer_type] = params[:album][:band_id], 'Band' if params[:album][:band_id]
    params[:album][:performer_id], params[:album][:performer_type] = params[:album][:artist_id], 'Artist' if params[:album][:artist_id]
    params[:album].delete_if { |k, v| k.to_s =~ /artist|band/ }
    @album = Album.new params[:album]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @album }
    end
  end

  def create
    @album = Album.new params[:album]

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to @album }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update_attributes params[:album]
        flash[:notice] = @album.name + ' updated.'
        format.html { redirect_to @album }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.xml  { head :ok }
    end
  end
end
