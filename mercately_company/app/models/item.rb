class Item < ApplicationRecord
  acts_as_paranoid

  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
