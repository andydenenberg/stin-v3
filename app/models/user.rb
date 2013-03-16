class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  
  
  # :registerable,  removed with applications controller pre-filter
  
         :recoverable, :rememberable, :trackable, :validatable # , :registerable, :confirmable

  # Setup accessible (or protected) attributes for your model
attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :first_name, :last_name, :role, :avatar

has_many :orgs
has_many :activities
has_many :donations

# uncomment to run local - comment to run on Heroku
#  config = YAML.load(File.read('../config.yml'))   
config = File.exist?('../config.yml') ? YAML.load(File.read('../config.yml')) : nil
key =  ENV['S3_KEY']
access_key =  ENV['S3_SECRET']
if config
 key =  config['access_key_id'] 
 access_key =  config['secret_access_key']
end

# paperclip
has_attached_file :avatar, 
  :storage => :s3 ,
  :bucket => 'stin_v4' ,
  :s3_credentials => {
    :access_key_id =>  key ,  # WATCHOUT for THE COMMA
    :secret_access_key =>  access_key
  } ,
  :styles => {
    :tiny => "25x25" ,
    :thumb => '100x100' ,
    :small => '150x150'
  }

end
