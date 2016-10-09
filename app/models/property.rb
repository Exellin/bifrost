class Property < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
  validate :pixel_or_hex, :not_pixeL_and_hex
  
  def self.set(property, type, default)
    if self.find_by_name(property).nil?
      default
    elsif type == "pixel_value"
      self.find_by_name(property).pixel_value
    elsif type == "hex_value"
      self.find_by_name(property).hex_value
    end
  end

  def pixel_or_hex
    if %w(pixel_value hex_value).all?{|attr| self[attr].blank?}
      errors.add :base, "A property requires a pixel or hex value"
    end
  end
  
  def not_pixeL_and_hex
    if !pixel_value.blank? and !hex_value.blank?
      errors.add :base, "A property can't have a pixel and hex value"
    end
  end
end