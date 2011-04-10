class Admin::ImagesController < Admin::AuthController
  # GET /images
  # GET /images.xml
  
  def index
    @work = Work.find(params[:work_id])
    #@comment = @page.comments.find(params[:id])
    
    @images = @work.images.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @work = Work.find(params[:work_id])
    @image = @work.images.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @work = Work.find(params[:work_id])
    @image = @work.images.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @work = Work.find(params[:work_id])
    @image = @work.images.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    @work = Work.find(params[:work_id])
    
    @image = @work.images.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to(admin_work_image_url(@work, @image), :notice => 'Image was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @work = Work.find(params[:work_id])
    @image = @work.images.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to(@image, :notice => 'Image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @work = Work.find(params[:work_id])
    @image = @work.images.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(admin_work_images_url(@work)) }
      format.xml  { head :ok }
    end
  end
end
