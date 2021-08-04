class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @recipe = Recipe.create
    @ingredients = Ingredient.create
    render :index
  end

  def new
    @tag = Tag.new
    render :new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    @tag = Tag.find(params[:id])
    render :show
  end

  def update
    @tag= Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end