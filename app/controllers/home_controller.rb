class HomeController < ApplicationController
  protect_from_forgery :only => [:index]
  def index
  end
  def contact
    if params[:name]
      if !(params[:name] == "") and !(params[:company] == "") and !(params[:email] == "") and !(params[:phonenumber] == "") and !(params[:message] == "")
        @showForm = false
        @errorForm = false
        @outputForm = "Email sent, thank you!"
        
        name = params[:name]
        company = params[:company]
        email = params[:email]
        phonenumber = params[:phonenumber]
        message = params[:message]
        if verify_recaptcha()
          ContactMailer.contactform_mail(name, company, email, phonenumber, message).deliver
        else
          @showForm = true
          @errorForm = true
          @outputForm = 'reCaptcha incorrect, to help me keep my inbox clean, please fill in the captcha field.'
        end
      else
        @showForm = true
        @errorForm = true
        @outputForm = 'Please make sure no field is empty. '
      end
    else
      @showForm = true
    end
  end
  def work
    @categories = Category.all
    @category_count = @categories.count
    
    @works = Work.all
  end
end
