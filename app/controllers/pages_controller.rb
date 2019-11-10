class PagesController < ApplicationController
  def home
  end

  def about 
  end

  def history
  end

  def people
  end

  def thanks
  end

  def whyInsaka
  end

  def transparency
  end

  def femaleEd
  end

  def waysToHelp
  end

  def donate
  end

  def forApplicants
  end

  def contact
    @sent = params[:sent] === 'true'
  end

  def sendmessage
    email = params[:email]
    emailName = params[:name]
    message = params[:message]

    ContactMailer.with(email: email, emailName: emailName, message: message).contact_us.deliver_now

    redirect_to controller: 'pages', action: 'contact', sent: 'true'
  end
end
