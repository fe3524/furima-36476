class Trading < ApplicationRecord
  with_options presence: true do
    validates :history
    validates :zipcode
    validates :state_id
    validates :city
    validates :address
    validates :phone_number
  end

  belongs_to :history
end
