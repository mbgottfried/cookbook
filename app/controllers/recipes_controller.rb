class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :create, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
        redirect_to @recipe, notice: 'Recipe was successfully added.'
      else
        render action: 'new'
      end
    end

  def update
      if @recipe.update(recipe_params)
        redirect_to @recipe, notice: 'Recipe was successfully updated.'
      else
        render action: 'edit'
      end
    end

  def destroy
    @recipe.destroy
    redirect_to recipes_url
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to recipes_path, notice: "You can only edit recipes you have contributed." if @recipe.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit([:title, :ingredients])
    end
end
