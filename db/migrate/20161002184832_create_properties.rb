class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string "name"
      t.integer "pixel_value"
      t.string "hex_value"
      t.integer "category_id"
    end
  end
end
