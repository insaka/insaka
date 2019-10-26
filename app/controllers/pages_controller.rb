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

    mail = Mail.new do
      from     email
      to       'wabray17@gmail.com'
      subject  'New Message from Insaka.com from ' + emailName
      body     message
    end

    mail.delivery_method :sendmail
    mail.deliver

    redirect_to controller: 'pages', action: 'contact', sent: 'true'
  end
end
