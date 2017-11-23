class AddTimestampsToCategories < ActiveRecord::Migration[5.1]
  def self.up
    add_column :categories, :created_at, :datetime
    change_column :categories, :created_at, :datetime, null: false
    add_column :categories, :updated_at, :datetime
    change_column :categories, :updated_at, :datetime, null: false
  end

  def self.down
    remove_column :categories, :created_at
    remove_column :categories, :updated_at
  end
end
