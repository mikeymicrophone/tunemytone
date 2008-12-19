class KnobsController < ApplicationController
  # GET /knobs
  # GET /knobs.xml
  def index
    @knobs = Knob.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knobs }
    end
  end

  # GET /knobs/1
  # GET /knobs/1.xml
  def show
    @knob = Knob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knob }
    end
  end

  # GET /knobs/new
  # GET /knobs/new.xml
  def new
    @knob = Knob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knob }
    end
  end

  # GET /knobs/1/edit
  def edit
    @knob = Knob.find(params[:id])
  end

  # POST /knobs
  # POST /knobs.xml
  def create
    @knob = Knob.new(params[:knob])

    respond_to do |format|
      if @knob.save
        flash[:notice] = 'Knob was successfully created.'
        format.html { redirect_to(@knob) }
        format.xml  { render :xml => @knob, :status => :created, :location => @knob }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knob.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knobs/1
  # PUT /knobs/1.xml
  def update
    @knob = Knob.find(params[:id])

    respond_to do |format|
      if @knob.update_attributes(params[:knob])
        flash[:notice] = 'Knob was successfully updated.'
        format.html { redirect_to(@knob) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knob.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knobs/1
  # DELETE /knobs/1.xml
  def destroy
    @knob = Knob.find(params[:id])
    @knob.destroy

    respond_to do |format|
      format.html { redirect_to(knobs_url) }
      format.xml  { head :ok }
    end
  end
end
