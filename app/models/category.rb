class Category < ActiveHash::Base
  self.data = [
    {ide: 1, name: "---"},
    {ide: 2, name: "レディース"},
    {ide: 3, name: "メンズ"},
    {ide: 4, name: "ベビー・キッズ"},
    {ide: 5, name: "インテリア・住まい・小物"},
    {ide: 6, name: "本・音楽・ゲーム"},
    {ide: 7, name: "家電・スマホ・カメラ"},
    {ide: 8, name: "スポーツ・レジャー"},
    {ide: 9, name: "ハンドメイド"},
    {ide: 10, name: "おもちゃ・ホビー・グッズ"},
    {ide: 11, name: "その他"}
  ]
end
