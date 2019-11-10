class ContactMailer < ApplicationMailer
  default to: 'wabray17@gmail.com'

  def contact_us
    @from = params[:email]
    @body = params[:message]
    @name = params[:emailName]

    mail(from: @from, subject: 'New Message from Insaka.com')
  end
end
