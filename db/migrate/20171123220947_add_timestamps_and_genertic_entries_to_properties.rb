class AddTimestampsAndGenerticEntriesToProperties < ActiveRecord::Migration[5.1]
  def self.up
    add_column :properties, :created_at, :datetime
    change_column :properties, :created_at, :datetime, null: false
    add_column :properties, :updated_at, :datetime
    change_column :properties, :updated_at, :datetime, null: false

    remove_column :properties, :pixel_value
    remove_column :properties, :hex_value

    change_column :properties, :category_id, :bigint, null: false
    add_index :properties, :category_id
    add_foreign_key :properties, :categories

    add_column :properties, :value, :string
    add_column :properties, :suffix, :string
  end

  def self.down
    remove_column :properties, :created_at
    remove_column :properties, :updated_at

    add_column :properties, :pixel_value, :integer
    add_column :properties, :hex_value, :string

    change_column :properties, :category_id, :integer, null: false
    remove_index :properties, :category_id
    remove_foreign_key :properties, :categories

    remove_column :properties, :value
    remove_column :properties, :suffix
  end
end
