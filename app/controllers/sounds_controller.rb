class SoundsController < ApplicationController
  # GET /sounds
  # GET /sounds.xml
  def index
    @sounds = Sound.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sounds }
    end
  end

  # GET /sounds/1
  # GET /sounds/1.xml
  def show
    @sound = Sound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sound }
    end
  end

  # GET /sounds/new
  # GET /sounds/new.xml
  def new
    @sound = Sound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sound }
    end
  end

  # GET /sounds/1/edit
  def edit
    @sound = Sound.find(params[:id])
  end

  # POST /sounds
  # POST /sounds.xml
  def create
    @sound = Sound.new(params[:sound])

    respond_to do |format|
      if @sound.save
        flash[:notice] = 'Sound was successfully created.'
        format.html { redirect_to(@sound) }
        format.xml  { render :xml => @sound, :status => :created, :location => @sound }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sounds/1
  # PUT /sounds/1.xml
  def update
    @sound = Sound.find(params[:id])

    respond_to do |format|
      if @sound.update_attributes(params[:sound])
        flash[:notice] = 'Sound was successfully updated.'
        format.html { redirect_to(@sound) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sounds/1
  # DELETE /sounds/1.xml
  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy

    respond_to do |format|
      format.html { redirect_to(sounds_url) }
      format.xml  { head :ok }
    end
  end
end
