class AddBrideUid < ActiveRecord::Migration[5.2]
    def change
        add_column :brides, :uid, :string
    end
end