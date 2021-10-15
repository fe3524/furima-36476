FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    # last_name             { person.last.kanji }
    # first_name            { person.first.kanji }
    # last_name_kana        { person.last.katakana }
    # first_name_kana       { person.first.katakana }
    # birthday              { Faker::Date.backward }
  end
end
