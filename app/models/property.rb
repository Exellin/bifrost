class Property < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
  validate :pixel_or_hex, :not_pixel_and_hex

  def self.set(property, type, default)
    if find_by_name(property).nil?
      default
    elsif type == 'pixel_value'
      find_by_name(property).pixel_value
    elsif type == 'hex_value'
      find_by_name(property).hex_value
    end
  end

  def pixel_or_hex
    return unless %w[pixel_value hex_value].all? { |attr| self[attr].blank? }
    errors.add :base, 'A property requires a pixel or hex value'
  end

  def not_pixel_and_hex
    return unless !pixel_value.blank? && !hex_value.blank?
    errors.add :base, "A property can't have a pixel and hex value"
  end
end
