class OrderInfo
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input ○○○-○○○○"}
    validates :prefecture, numericality: {other_than: 1}
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A[0-9]+\z/, message: "Input Input half-width characters & figure"}, length: {maximum: 11}
    # validates :user_id
    # validates :item_id
  end

  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end

end