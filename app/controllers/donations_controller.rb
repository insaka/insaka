class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  def new
    @donation = Donation.new
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def create
    @donation = Donation.new(:amount => params["donation"]["amount"], :purchased_at => Time.now)
    @donation.girl_id = params["donation"]["girl_id"].to_i
    if @donation.save
      redirect_to @donation.paypal_url(donation_path(@donation))
    else
      redirect_to '/pages/candidates', alert: "Donation error: #{@donation.errors.messages}"
    end
  end

  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @donation = Donation.find params[:invoice]
      girl = Girl.find_by(:name => params[:item_name])
      girl.amount_funded = girl.amount_funded == nil ? 0 : girl.amount_funded
      girl.amount_funded += params["mc_gross"].to_i
      girl.percent_funded = (girl.amount_funded/1250).to_f
      girl.save!
      if girl.save
        @donation.notification_params = params.to_h
        @donation.status = params.to_h["payment_status"]
        @donation.transaction_id = params.to_h["txn_id"]
        @donation.purchased_at = params.to_h["payment_date"]
        @donation.save!
      end
    end
    render :show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def donation_params
    params.require(:donation).permit(:girl_id, :full_name, :email, :telephone, :girl, :name, :transaction_id, :status)
  end
end
