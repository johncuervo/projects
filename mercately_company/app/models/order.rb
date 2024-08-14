class Order < ApplicationRecord
  acts_as_paranoid

  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates :order_number, presence: true, uniqueness: true, format: { with: /\AOrder_\w{8}-\w{4}-\w{4}-\w{4}-\w{12}\z/ }
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  def calculate_total_price
    self.order_items.each do |order_item|
      item = Item.find(order_item.item_id)
      self.total_price += item.price * order_item.quantity if item
    end

    self.save
  end
end
