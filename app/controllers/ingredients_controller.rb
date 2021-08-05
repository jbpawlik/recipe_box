class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    render :index
  end

  def search
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @ingredient = Ingredient.find_by(params[:name])
    @recipe = Recipe.find_by(params[:name])
    @ingredient_search = Ingredient.search(:search)
    render :search
  end

  def new
    @ingredient = Ingredient.new
    render :new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      flash[:notice] = "Ingredient successfully added!"
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = Recipe.all
    render :show
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def update
      @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
        render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :search)
    end

end