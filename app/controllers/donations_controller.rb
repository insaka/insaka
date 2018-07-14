class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(:amount => params["donation"]["amount"])
    @donation.girl_id = params["donation"]["girl_id"].to_i
    if @donation.save
      girl = Girl.find @donation.girl_id
      girl.amount_funded = girl.amount_funded == nil ? 0 : girl.amount_funded
      girl.amount_funded += params["donation"]["amount"].to_i
      girl.percent_funded = (girl.amount_funded/1250).to_f
      girl.save!
      if girl.save!
        redirect_to @donation.paypal_url(donation_path(@donation))
      else
        render :new
      end
    else
      render :new
    end
  end

  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @donation = Donation.find params[:invoice]
      @donation.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def donation_params
    params.require(:donation).permit(:girl_id, :full_name, :email, :telephone, :girl)
  end
end
