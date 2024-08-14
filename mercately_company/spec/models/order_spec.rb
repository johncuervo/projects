require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with valid attributes' do
    order = Order.new(order_number: 'Order_abcdefgh-ijkl-mnop-qrst-uvwxyz123456', total_price: 100.0)
    expect(order).to be_valid
  end

  it 'is not valid without an order_number' do
    order = Order.new(order_number: nil, total_price: 100.0)
    expect(order).not_to be_valid
    expect(order.errors[:order_number]).to include("can't be blank")
  end

  it 'is not valid with an invalid order_number format' do
    order = Order.new(order_number: 'InvalidFormat', total_price: 100.0)
    expect(order).not_to be_valid
    expect(order.errors[:order_number]).to include("is invalid")
  end

  it 'is not valid with a negative total_price' do
    order = Order.new(order_number: 'Order_1234', total_price: -1)
    expect(order).not_to be_valid
    expect(order.errors[:total_price]).to include("must be greater than or equal to 0")
  end

  describe '#calculate_total_price' do
    let(:order) { Order.new(order_number: 'Order_1234', total_price: 0) }

    it 'calculates total price correctly' do
      item = instance_double('Item', id: 1, price: 50.0)
      order_item = instance_double('OrderItem', item_id: item.id, quantity: 2)
      allow(order).to receive_message_chain(:order_items, :each).and_yield(order_item)
      allow(Item).to receive(:find).with(order_item.item_id).and_return(item)

      order.calculate_total_price
      expect(order.total_price).to eq(100.0)
    end

    it 'handles missing items gracefully' do
      order_item = instance_double('OrderItem', item_id: 999, quantity: 2)
      allow(order).to receive_message_chain(:order_items, :each).and_yield(order_item)
      allow(Item).to receive(:find).with(order_item.item_id).and_return(nil)

      order.calculate_total_price
      expect(order.total_price).to eq(0)
    end
  end
end
