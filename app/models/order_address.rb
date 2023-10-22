class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :user_id, :item_id

  validates :token, :postal_code, :city, :address, :phone_number, :prefecture_id, :user_id, :item_id, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width numbers" }
  validates :phone_number, length: { in: 10..11, message: "is out of setting range" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end