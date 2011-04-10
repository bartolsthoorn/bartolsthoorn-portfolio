class ContactMailer < ActionMailer::Base
  default :from => "hello@bartolsthoorn.nl"
  def contactform_mail(name, company, email, phonenumber, message)
    @name = name
    @company = company
    @email = email
    @phonenumber = phonenumber
    @message = message
    mail(:to => "bartolsthoorn@gmail.com", :subject => "Contact via bartolsthoorn.nl: #{@name}")
  end
end
