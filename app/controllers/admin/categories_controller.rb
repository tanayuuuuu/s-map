class Admin::CategoriesController < ApplicationController

  before_action :add_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.admin_id = current_admin.id
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def add_category
    @category = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
