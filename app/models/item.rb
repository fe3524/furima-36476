class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :price, inclusion: { in: 300..9_999_999, message: 'out of range' }
  validates :price, numericality: { only_integer: true }

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  # has_one :history
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :state
  belongs_to :fee
  belongs_to :day
end
