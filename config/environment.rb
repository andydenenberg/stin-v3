# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
StinV4::Application.initialize!


# http://guides.rubyonrails.org/action_mailer_basics.html#walkthrough-to-generating-a-mailer

# If you are a Heroku user using the SendGrid plugin, and would like to access the SendGrid web
# interface, you can find your SendGrid credentials by issuing the following command: 

#   heroku config --long

#You can also go the other direction and configure heroku to use an existing SendGrid account and password. Just run the following commands from your shell: 

#heroku config:add SENDGRID_USERNAME=existing_username 
#heroku config:add SENDGRID_PASSWORD=existing_password 
#heroku restart 

#Make sure that your SENDGRID_DOMAIN config var matches the website field in your SendGrid profile.

