class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string "name"
      t.string "group"
      t.integer "pixel_value"
      t.string "hex_value"
    end
  end
end
