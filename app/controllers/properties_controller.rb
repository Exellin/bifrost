class PropertiesController < ApplicationController
  before_action :require_admin
  
  def new
    @property = Property.new
  end
  
  def edit
  end
  
  def update
    if @property.update(property_params)
    else
      render 'edit'
    end
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
    else
      render 'new'
    end
  end
  
  def destroy 
    @property.destroy
  end
  
  private
  
  def property_params
    params.permit(:name, :group, :pixel_value, :hex_value)
  end
end
