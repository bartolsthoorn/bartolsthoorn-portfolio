class Admin::WorksController < Admin::AuthController
  # GET /works
  # GET /works.xml
  
  def index
    @works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @works }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    get_all_categories
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    get_all_categories
    @work = Work.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/1/edit
  def edit
    get_all_categories
    @work = Work.find(params[:id])
  end

  # POST /works
  # POST /works.xml
  def create
    @work = Work.new(params[:work])
    
    respond_to do |format|
      if @work.save
        format.html { redirect_to(admin_work_url(@work), :notice => 'Work was successfully created.') }
        format.xml  { render :xml => @work, :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work = Work.find(params[:id])
    
    @count = 0
    categories = Array.new
    params[:category_list].each do |k, v| 
      categories[@count] = Category.find(k.to_i)
      @count = @count + 1
    end
    @work.categories = categories
    
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to(admin_work_url(@work), :notice => 'Work was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to(admin_works_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def get_all_categories
      @categories = Category.find(:all)
    end
end
