require "rails_helper"

RSpec.describe MatchFulfilmentService do
  describe "call" do
    let(:donation) { create(:donation) }

    context "when match type is donor" do
      let!(:match) { create(:match, match_type: :donor) }

      it "Updates match based on donation" do
        MatchFulfilmentService.new(donation).call
        expect(match.reload.pledge_fulfilled).to eql match.pledge_amount
      end
    end

    context "when match type is dollar" do
      let!(:match) { create(:match, match_type: :dollar) }

      it "Updates match based on donation" do
        MatchFulfilmentService.new(donation).call
        expect(match.reload.pledge_fulfilled).to eql (match.pledge_amount * donation.amount)
      end
    end
  end
end
