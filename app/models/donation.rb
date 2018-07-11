class Donation < ApplicationRecord
  belongs_to :girl
  serialize :notification_params, Hash

  def paypal_url(return_path)
    values = {
      business: "admin@insaka.org",
      cmd: "_xclick",
      upload: 1,
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      invoice: id,
      amount: amount,
      description: self.girl.name,
      item_name: self.girl.name,
      notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
