class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.references :org
      t.references :user

      t.timestamps
    end
    add_index :activities, :org_id
    add_index :activities, :user_id
  end
end
