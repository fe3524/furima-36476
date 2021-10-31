class Form
  include ActiveModel::Model

  attr_accessor :zipcode, :state_id, :city, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :state_id, numericality: { other_than: 1 }
    validates :city, :address, :user_id, :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :zipcode, format: {
    with: /\A[0-9]{3}-[0-9]{4}\z/, 
    message: "is invalid. Include hyphen(-)"
  }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Trading.create(
      history_id: history.id,
      zipcode: zipcode,
      state_id: state_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end
end