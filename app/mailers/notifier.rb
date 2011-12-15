class Notifier < ActionMailer::Base
  default :from => "andy@ospreypointpartners.com"

include SendGrid

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    @user = user
    mail( :to => 'andy@denenberg.net' , # user.email 
          :subject => "New User has signed up" )
#         , :body => user.name + " " + user.email + " " + user.comments )
  end
end

# "name"
# "email"
# "reference"
# "phone"
# "comments"
# "verified"
# "created_at"
