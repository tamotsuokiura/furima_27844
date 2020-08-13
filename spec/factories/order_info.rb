FactoryBot.define do
  factory :order_info do
    postal_code      {"111-1111"}
    prefecture       {2}
    city             {"東京"}
    house_number     {"1111"}
    building_name    {"トキワ荘"}
    tel              {"00000000000"}
    user_id          {1}
    item_id          {1}
  end
end