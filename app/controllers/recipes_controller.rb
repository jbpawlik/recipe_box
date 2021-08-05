class RecipesController < ApplicationController

  def index
    @tags = Tag.all
    @ingredients = Ingredient.all
    @searched_ingredient = Ingredient.search(params[:search])

    @recipes = Recipe.all
    render :index
  end

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
    @tag = Tag.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    tag_ids = params.fetch("recipe").fetch("tag_ids")
    ingredient_ids = params.fetch("recipe").fetch("ingredient_ids")
    tag_ids.each do |tag_id| 
      if tag_id != ""
        @recipe.tags << Tag.find(tag_id)
      end
    end
    ingredient_ids.each do |ingredient_id| 
      if ingredient_id != ""
        @recipe.ingredients << Ingredient.find(ingredient_id)
      end
    end
    if @recipe.save
      flash[:notice] = "Recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
    

  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    @tags = @recipe.tags 
    # tag = Tag.new(params[:tag_name])
    # @tag = Tag.find(params[:id])
    # @recipe.tags << tag
    # @ingredients = @recipe.ingredients
    render :show
  end

  def update
    @recipe= Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :rating, :instructions, :tag_ids, :ingredient_ids)
  end

end