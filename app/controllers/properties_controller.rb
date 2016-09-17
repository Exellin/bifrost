class PropertiesController < ApplicationController
  include ApplicationHelper
  before_action :require_admin
  before_action :set_property, only: [:edit, :update, :destroy]
  before_action :set_groups, only: [:index]
  
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def edit
  end
  
  def update
    if @property.update(property_params)
      redirect_to properties_path
    else
      render 'edit'
    end
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render 'new'
    end
  end
  
  def destroy 
    @property.destroy
    redirect_to properties_path
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :group, :pixel_value, :hex_value)
  end
  
  def set_property
    @property = Property.find(params[:id])
  end
  
  def set_groups
    properties = Property.all
    @groups = Array.new
    properties.each do |property|
      unless @groups.include?(property.group)
        @groups.push(property.group)
      end
    end 
  end
end
