class MatchFulfilmentService
  attr_reader :donation

  def initialize(donation)
    @donation = donation
  end

  def call
    Match.open.find_each do |match|
      next if donation.donor_id.eql? match.donor_id
      match.closed! and next if match.expired?

      match.pledge_fulfilled += valid_pledge_amount(match)
      match.status = :closed if match.pledge_completed?
      match.save
    end
  end

  private

  def valid_pledge_amount(match)
    due_amount = match.amount_due_for donation
    remaining_pledge = match.remaining_pledge

    [due_amount, remaining_pledge].min
  end
end
