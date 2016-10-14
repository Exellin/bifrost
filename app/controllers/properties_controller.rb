class PropertiesController < ApplicationController
  include ApplicationHelper
  before_action :require_admin
  before_action :set_property, only: [:edit, :update, :destroy]
  
  def new
    @property = Property.new
  end
  
  def edit
  end
  
  def update
    if @property.update(property_params)
      generate_stylesheet(@property.category.name)
      redirect_to category_path(@property.category)
    else
      render 'edit'
    end
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
      generate_stylesheet(@property.category.name)
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
    params.require(:property).permit(:name, :pixel_value, :hex_value, :category_id)
  end
  
  def set_property
    @property = Property.find(params[:id])
  end
  
  def generate_stylesheet(category)
      stylesheet = GenerateStylesheets.new(category)
      stylesheet.compile
  end
end