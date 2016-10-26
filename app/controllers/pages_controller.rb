class PagesController < ApplicationController 
  include ApplicationHelper
  before_action :require_admin, except: [:construction]
  def home
  end
  
  def construction
    render :layout => "construction"
  end
  
  def about
  end
  
  def services
  end
  
  def staff
  end
  
  def newsroom
  end
  
  def contact
  end
  
end
  