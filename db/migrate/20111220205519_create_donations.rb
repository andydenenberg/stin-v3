class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :org_id
      t.integer :user_id
      t.integer :kind
      t.decimal :value
      t.text :description
      t.string :made_by

      t.timestamps
    end
  end
end
