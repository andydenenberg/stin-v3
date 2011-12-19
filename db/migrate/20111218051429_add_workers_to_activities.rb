class AddWorkersToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :worker1, :integer
    add_column :activities, :worker2, :integer
    add_column :activities, :worker3, :integer
    add_column :activities, :worker4, :integer
    add_column :activities, :worker5, :integer
  end
end
