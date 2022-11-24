class DonationsController < ApplicationController
  def index
    @donations = Donation.includes(:donor).all
  end

  def new
    @donation = current_user.donations.build
  end

  def create
    @donation = current_user.donations.build(donation_params)

    render :new and return unless @donation.save

    MatchDonationJob.new.perform(@donation.id)
    redirect_to donations_path
  end

  private

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
