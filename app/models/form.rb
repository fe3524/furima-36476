class Form
  include ActiveModel::Model

  attr_accessor :token, :zipcode, :state_id, :city, :address, :building, :phone_number, :item_id, :user_id

  validates :zipcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :token, :city, :addresses, :user_id, :item_id, presence: true
  #validates :state_id, presense: true

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Trading.create(
      zipcode: zipcode,
      state_id: state_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      history_id: history_id
    )
  end
end