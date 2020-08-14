FactoryBot.define do

  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password              {"00000000a"}
    password_confirmation {"00000000a"}
    name_kanzi_first      {"太郎"}
    name_kanzi_last       {"田中"}
    name_kana_first       {"タロウ"}
    name_kana_last        {"タナカ"}
    birth                 {"1987-11-27"}
  end

end