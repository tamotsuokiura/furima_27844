class Duration < ActiveHash::Base
  self.data = [
    {ide: 1, name: "---"},
    {ide: 2, name: "1〜2日で発送"},
    {ide: 3, name: "2〜3日で発送"},
    {ide: 4, name: "4〜7日で発送"},
  ]
end
