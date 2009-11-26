class OutputsController < ApplicationController
  # GET /outputs
  # GET /outputs.xml
  def index
    @outputs = Output.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outputs }
    end
  end

  # GET /outputs/1
  # GET /outputs/1.xml
  def show
    @output = Output.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @output }
    end
  end

  # GET /outputs/new
  # GET /outputs/new.xml
  def new
    @output = Output.new params[:output]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @output }
    end
  end

  # GET /outputs/1/edit
  def edit
    @output = Output.find(params[:id])
  end

  # POST /outputs
  # POST /outputs.xml
  def create
    @output = Output.new(params[:output])

    respond_to do |format|
      if @output.save
        flash[:notice] = 'Output was successfully created.'
        format.html { redirect_to(@output) }
        format.xml  { render :xml => @output, :status => :created, :location => @output }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @output.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outputs/1
  # PUT /outputs/1.xml
  def update
    @output = Output.find(params[:id])

    respond_to do |format|
      if @output.update_attributes(params[:output])
        flash[:notice] = 'Output was successfully updated.'
        format.html { redirect_to(@output) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @output.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outputs/1
  # DELETE /outputs/1.xml
  def destroy
    @output = Output.find(params[:id])
    @output.destroy

    respond_to do |format|
      format.html { redirect_to(outputs_url) }
      format.xml  { head :ok }
    end
  end
end
