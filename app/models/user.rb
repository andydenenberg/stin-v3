class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  
  
  # :registerable,  removed with applications controller pre-filter
  
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :first_name, :last_name, :role, :avatar

has_many :orgs
has_many :activities
has_many :donations

#  config = YAML.load(File.read('../../../desktop/config.yml'))   

# paperclip
has_attached_file :avatar, 
  :storage => :s3 ,
  :bucket => 'stin_v4' ,
  :s3_credentials => {
    :access_key_id =>  ENV['S3_KEY'] || config['access_key_id'] ,  # WATCHOUT for THE COMMA
    :secret_access_key =>  ENV['S3_SECRET'] || config['secret_access_key']
  } ,
  :styles => {
    :tiny => "25x25" ,
    :thumb => '100x100' ,
    :small => '150x150'
  }

end
