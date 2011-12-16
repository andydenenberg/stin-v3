class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :organization
      t.string :division
      t.string :address
      t.string :city
      t.string :description
      t.string :background
      t.references :user

      t.timestamps
    end
    add_index :orgs, :user_id
    
  end
end
