class History < ApplicationRecord
  validates :user, presence: true
  validates :item, presence: true

  belongs_to :user
  has_one :item
  has_one :trading
end
