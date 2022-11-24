class MatchDonationJob < ApplicationJob
  queue_as :default

  def perform(donation_id)
    donation = Donation.find donation_id
    MatchFulfilmentService.new(donation).call
  end
end
