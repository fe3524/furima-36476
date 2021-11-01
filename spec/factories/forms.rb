FactoryBot.define do
  factory :form do
    token { 'tok_abcdefghijk00000000000000000' }
    zipcode { '222-2222' }
    state_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1' }
    building { '碧ビル3302号室' }
    phone_number { '0311111111' }
  end
end
