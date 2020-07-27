# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name_kanzi_first|string|null: false|
|name_kanzi_last|string|null: false|
|name_kana_first|string|null: false|
|name_kana_last|string|null: false|
|birth|date|null: false|


### Association
- has_many :items



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false, unique: true|
|image|string|null: false|
|category|integer|null: false|
|condition|integer|null: false|
|carriage|integer|null: false|
|user|references|foreign_key: true|


### Association
- belongs_to :user
- has_one :order



## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|item|references|foreign_key: true|


### Association
- belongs_to :item