class Match < ApplicationRecord
  belongs_to :donor, class_name: "User"
  validates :end_date, :pledge_limit, :pledge_amount, presence: true
  validates :pledge_fulfilled, comparison: {less_than_or_equal_to: :pledge_limit}

  enum status: %i[open closed]
  enum match_type: %i[dollar donor]
end
