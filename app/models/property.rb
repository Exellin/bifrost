class Property < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :value, presence: true
end
