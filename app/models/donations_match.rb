class DonationsMatch < ApplicationRecord
  belongs_to :donation
  belongs_to :match
end
