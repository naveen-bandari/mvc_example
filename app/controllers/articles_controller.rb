class ArticlesController < BaseController #mid layer controller
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :eligible_for_update, only: %i[update]
  before_action :set_total_read_count, only: %i[index]

  # GET /articles or /articles.json
  # method/action

  def mark_as_read
    @article.update(read: true)
  end

  def index
    @per_page = per_page
    # render json: { articles: @articles }, status: :ok
    @articles = Article.first(@per_page.to_i)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {}).permit(:name, :description, :comments)
    end

    def eligible_for_update
      not_allowed_list = ['Naveen', 'Test one']

      if not_allowed_list.include? @article.name
        render(json: { message: "You can't update this article" }, status: 422) && return
      end
    end

    def set_total_read_count
      # @total_read_count = Article.where(read: true).count
      @total_read_count = 3
    end
end
