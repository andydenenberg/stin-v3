class AddUseridToOrgs < ActiveRecord::Migration
  def change
    add_column :orgs, :avatar_file_name,    :string
    add_column :orgs, :avatar_content_type, :string
    add_column :orgs, :avatar_file_size,    :integer
    add_column :orgs, :avatar_updated_at,   :datetime
  end
  
  def self.down
    remove_column :orgs, :avatar_file_name
    remove_column :orgs, :avatar_content_type
    remove_column :orgs, :avatar_file_size
    remove_column :orgs, :avatar_updated_at
  end
  
end
