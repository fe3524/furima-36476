class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  validates :state_id, presence: true
  validates :fee_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true

  belongs_to :user
  #has_one :history
  has_one_attached :image
end
