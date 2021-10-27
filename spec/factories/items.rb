FactoryBot.define do
  factory :item do
    title { 'テスト' }
    description { 'テスト' }
    category_id { 2 }
    status_id { 2 }
    state_id { 2 }
    fee_id { 2 }
    day_id { 2 }
    price { 300 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
