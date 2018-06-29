class AddCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :link
      t.string :material
      t.integer :length
    end
  end
end
