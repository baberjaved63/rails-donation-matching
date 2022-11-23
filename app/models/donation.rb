class Donation < ApplicationRecord
  belongs_to :donor, class_name: "User"

  validates :amount, numericality: {greater_than_or_equal_to: 1.0}
end
