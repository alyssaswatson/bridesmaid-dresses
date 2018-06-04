class CreateDresses < ActiveRecord::Migration[5.2]
  def change
    create_table :dresses do |t|
      t.string :link
      t.string :material
      t.integer :length
    end
  end
end
