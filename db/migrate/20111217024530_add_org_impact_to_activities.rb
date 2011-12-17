class AddOrgImpactToActivities < ActiveRecord::Migration
    def change
      add_column :activities, :organization, :string
      add_column :activities, :impact, :integer
      add_column :activities, :reward, :integer
      add_column :activities, :starttime, :datetime
      add_column :activities, :endtime, :datetime
    end
end

