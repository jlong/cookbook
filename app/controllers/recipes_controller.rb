class RecipesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :set_recipe
  before_filter :only_allow_creator, only: %w(edit update)

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.created_by = @recipe.updated_by = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /recipes/1
  def update
    @recipe.updated_by = current_user

    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url
  end

  protected

    def set_recipe
      @recipe = Recipe.find(params[:id]) if params[:id]
    end

    def only_allow_creator
      redirect_to recipes_url, notice: 'You must be the creator of a recipe to edit it' unless @recipe.created_by_id === current_user.id
    end

end
