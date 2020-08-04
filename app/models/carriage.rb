class Carriage < ActiveHash::Base
  self.data = [
    {ide: 1, name: "---"},
    {ide: 2, name: "着払い（購入者負担）"},
    {ide: 3, name: "送料込み（出品者負担）"}
  ]
end
