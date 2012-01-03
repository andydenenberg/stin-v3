class AddDateMadeToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :datemade, :string
  end
end
