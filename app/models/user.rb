class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :donations, inverse_of: :donor, foreign_key: :donor_id, dependent: :destroy
  has_many :matches, inverse_of: :donor, foreign_key: :donor_id, dependent: :destroy
end
