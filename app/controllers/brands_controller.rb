class BrandsController < ApplicationController
  # GET /brands
  # GET /brands.xml
  def index
    @brands = Brand.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brands }
    end
  end

  # GET /brands/1
  # GET /brands/1.xml
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.xml
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.xml
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        flash[:notice] = 'Brand was successfully created.'
        format.html { redirect_to(@brand) }
        format.xml  { render :xml => @brand, :status => :created, :location => @brand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.xml
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        flash[:notice] = 'Brand was successfully updated.'
        format.html { redirect_to(@brand) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.xml
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to(brands_url) }
      format.xml  { head :ok }
    end
  end
end
