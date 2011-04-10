ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "bartolsthoorn.nl",  
  :user_name            => "bartolsthoorn",  
  :password             => "boaklerak",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}