class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, presence: true numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, presence: true numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, presence: true numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence: true numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :history
  belongs_to :category
  belongs_to :status
  has_one_attached :image
end
