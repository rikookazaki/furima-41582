class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address_num, :building, :phone_num, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id, :order_id, :prefecture_id, :city, :address_num
    validates :post_cord, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_cord:, prefecture_id:, city:, address_num:, building:, phone_num:, order_id: order.id)
  end
end
