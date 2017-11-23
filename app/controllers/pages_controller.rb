class PagesController < ApplicationController
  include ControllerHelper
  before_action :require_admin, except: [:construction]
  before_action :set_navbar_variables

  def home; end

  def construction
    @disable_navbar = true
  end

  def about; end

  def services; end

  def staff; end

  def newsroom; end

  def contact; end
end
