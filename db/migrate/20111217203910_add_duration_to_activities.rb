class AddDurationToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :duration, :decimal
  end
end
