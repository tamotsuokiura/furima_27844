FactoryBot.define do
  factory :item do
    name              {"ギター"}
    description       {"カートコバーンに遺品"}
    category_id          {2}
    condition_id         {2}
    carriage_id          {2}
    area_id              {2}
    duration_id          {2}
    price             {1000}
    association :user_id, factory: :user
  end
end
