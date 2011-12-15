class AddProfileInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :facebook, :string
    add_column :users, :comments, :text
    
    add_column :users, :role, :integer
    
    add_column :users, :avatar_file_name,    :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size,    :integer
    add_column :users, :avatar_updated_at,   :datetime
  end
  
  def self.down
    remove_column :users, :first_nam, :string
    remove_column :users, :last_name, :string
    remove_column :users, :username, :string
    remove_column :users, :address, :string
    remove_column :users, :city, :string
    remove_column :users, :facebook, :string
    remove_column :users, :comments, :text
    
    remove_column :role, :role, :integer
    
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
     end
end
