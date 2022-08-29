# frozen_string_literal: true

class CategoriesController < BaseController
  before_action :set_category, only: %i[show update destroy edit]

  def index
    @categories = Category.all
  end

  def show; end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save!
        format.html { redirect_to category_url(@category), notice: 'New Category was added.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @category = Category.new
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    puts '===================IN set_category===================='
    @category = Category.find(params[:id])
    puts "===================IN set_category@category:::#{@category.inspect}===================="
  end

  # Only allow a list of trusted parameters through.
  def category_params
    # we will whitelist only the required params as per the business case
    params.fetch(:category, {}).permit(:name)
  end
end
