class Org < ActiveRecord::Base
  
  belongs_to :user
  has_many :activities
  has_many :donations
  
  
  # for local storage use the next line
  #  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :tiny => "25x25>" }

  # to store on S3 use the following:

#    config = YAML.load(File.read('../../../desktop/config.yml'))   

    # paperclip
    has_attached_file :avatar, 
      :storage => :s3 ,
      :bucket => 'stin_v4' ,
      :s3_credentials => {
        :access_key_id =>  ENV['S3_KEY'] , # || config['access_key_id'] ,  # WATCHOUT for THE COMMA
        :secret_access_key =>  ENV['S3_SECRET']   #|| config['secret_access_key']
      } ,
      :styles => {
        :tiny => "25x25" ,
        :thumb => '100x100' ,
        :small => '150x150'
      }
  
end
