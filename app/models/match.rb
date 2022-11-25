class Match < ApplicationRecord
  belongs_to :donor, class_name: "User"
  has_many :donations_matches, dependent: :destroy

  validates :end_date, :pledge_limit, :pledge_amount, presence: true
  validates :pledge_fulfilled, comparison: {less_than_or_equal_to: :pledge_limit}

  enum status: %i[open closed]
  enum match_type: %i[dollar donor]

  def closed?
    super || expired?
  end

  def expired?
    end_date < Date.today
  end

  def remaining_pledge
    pledge_limit - pledge_fulfilled
  end

  def amount_due_for(donation)
    return pledge_amount if donor?

    pledge_amount * donation.amount
  end

  def pledge_completed?
    (pledge_limit - pledge_fulfilled).zero?
  end
end
