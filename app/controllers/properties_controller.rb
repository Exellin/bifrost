class PropertiesController < ApplicationController
  include ApplicationHelper
  before_action :require_admin
  before_action :set_property, only: [:edit, :update, :destroy]

  def new
    @category = Category.find(params[:category_id])
    @property = @category.properties.build
  end

  def edit
    @category = @property.category
  end

  def update
    if @property.update(property_params)
      redirect_to category_path(@property.category)
    else
      render 'edit'
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @property = @category.properties.create(property_params)
    if @property.save
      redirect_to category_path(@property.category)
    else
      render 'new'
    end
  end

  def destroy
    category = @property.category
    @property.destroy
    redirect_to category_path(category)
  end

  private

  def property_params
    params.require(:property).permit(:name, :value, :suffix)
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def generate_stylesheet(category)
    stylesheet = GenerateStylesheets.new(category)
    stylesheet.compile
  end
end
