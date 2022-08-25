class BlogsController < BaseController
	before_action :set_blog, only: [:show, :edit, :update, :destroy]

	def index
		@blogs = Blog.all
	end

	def show
		
	end

	def new
		@select_options = ['first', 'second', 'third']
		@blog = Blog.new #This is not yet stored in DB, it is just a new object
	end

	def edit
		
	end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save!
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@blog.destroy!
	end

	private

	def set_blog
		@blog = Blog.find(params[:id])
	end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.fetch(:blog, {}).permit(:name, :public)
  end

end