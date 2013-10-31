class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
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
    redirect_to recipe_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title)
    end
end
