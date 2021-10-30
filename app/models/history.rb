class History < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :trading
  belongs_to :state
end