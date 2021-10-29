class History < ApplicationRecord

  belongs_to :user
  has_one :item
  has_one :trading
end
