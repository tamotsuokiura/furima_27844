class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :carriage
  belongs_to_active_hash :area
  belongs_to_active_hash :duration

  has_one_attached :image
  belongs_to :user


  validates :name, length: { maximum: 40}
  validates :description, length: { maximum: 1000}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category
    validates :condition
    validates :carriage
    validates :area
    validates :duration
    validates :price
  end

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :carriage_id
    validates :area_id
    validates :duration_id
  end
end
