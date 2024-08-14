require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    item = Item.new(name: 'Item', price: 10.0)
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    item = Item.new(name: nil, price: 10.0)
    expect(item).not_to be_valid
    expect(item.errors[:name]).to include("can't be blank")
  end

  it 'is not valid with a negative price' do
    item = Item.new(name: 'Item', price: -1)
    expect(item).not_to be_valid
    expect(item.errors[:price]).to include("must be greater than or equal to 0")
  end

  it 'has many order_items' do
    association = described_class.reflect_on_association(:order_items)
    expect(association.macro).to eq :has_many
  end

  it 'has many orders through order_items' do
    association = described_class.reflect_on_association(:orders)
    expect(association.macro).to eq :has_many
    expect(association.through_reflection.name).to eq :order_items
  end
end
