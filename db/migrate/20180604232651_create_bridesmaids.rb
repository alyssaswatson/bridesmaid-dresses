class CreateBridesmaids < ActiveRecord::Migration[5.2]
  def change
    create_table :bridesmaids do |t|
      t.string :name
      t.belongs_to :bride, foreign_key: true
      t.belongs_to :dress, foreign_key: true
    end
  end
end
