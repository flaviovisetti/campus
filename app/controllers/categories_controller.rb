class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category_params = params.require(:category).permit(:name)
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category)
    else
      flash.now[:alert]= 'Não é possível cadastrar categoria'
      render :new
    end
  end


end
