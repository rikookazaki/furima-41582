class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address_num, :building, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :address_num, :token
    validates :post_cord, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_cord:, prefecture_id:, city:, address_num:, building:, phone_num:, order_id: order.id)
  end
end
