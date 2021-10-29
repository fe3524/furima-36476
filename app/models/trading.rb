class Trading < ApplicationRecord
  validates :history, presence: true
  validates :zipcode, presence: true
  validates :state_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  has_one :history
end
