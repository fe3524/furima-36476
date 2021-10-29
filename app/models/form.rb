class Form
  include ActiveModel::Model

  attr_accessor :token, :zipcode, :state_id, :city, :address, :building, :phone_number, :item_id, :user_id

  validates :zipcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :token, :city, :addresses, :user_id, :item_id, presence: true
  validates :state_id, presense: true, numericality: {other_than: 1}

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end