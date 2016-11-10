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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category_params = params.require(:category).permit(:name)
    category = Category.find(params[:id])

    if category.update(category_params)
      redirect_to category_url(category)
    else
      @category = Category.find(params[:id])
      flash.now[:alert] = 'Não é possível atualizar categoria'
      render :edit
    end
  end

end
