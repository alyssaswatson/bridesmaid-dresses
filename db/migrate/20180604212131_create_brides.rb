class CreateBrides < ActiveRecord::Migration[5.2]
  def change
    create_table :brides do |t|
      t.string :name
      t.string :password_digest
      t.datetime :wedding_date
      t.string :grooms_name
    end
  end
end
