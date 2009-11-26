class BandsController < ApplicationController
  def index
    @bands = Band.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @bands }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @band }
    end
  end

  def new
    @band = Band.new params[:band]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @band }
    end
  end

  def create
    @band = Band.new(params[:band])

    respond_to do |format|
      if @band.save
        flash[:notice] = 'Band was successfully created.'
        format.html { redirect_to(@band) }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @band.update_attributes(params[:band])
        flash[:notice] = 'Band was successfully updated.'
        format.html { redirect_to(@band) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(bands_url) }
      format.xml  { head :ok }
    end
  end
end
