class Condition < ActiveHash::Base
  self.data = [
    {ide: 1, name: "---"},
    {ide: 2, name: "新品、未使用"},
    {ide: 3, name: "未使用に近い"},
    {ide: 4, name: "目立った傷や汚れなし"},
    {ide: 5, name: "やや傷や汚れあり"},
    {ide: 6, name: "傷や汚れあり"},
    {ide: 7, name: "全体的に状態が悪い"}
  ]
end
