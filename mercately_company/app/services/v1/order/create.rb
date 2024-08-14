module ::V1::Order
  class Create < ApplicationService
    attr_reader :order_items

    def initialize(order_items)
      @order_items = order_items
    end

    def call
      create_order
    end

    private

    def create_order
      ActiveRecord::Base.transaction do
        order = build_order

        if order.save!
          if create_order_items(order)
            order.calculate_total_price
          end
          [:created, order]
        else
          [:unprocessable_entity, order]
        end
      rescue ActiveRecord::RecordInvalid => e
        [:unprocessable_entity, order]
      rescue StandardError => e
        order.really_destroy! if order.persisted?

        [:error, e.message]
      end
    end

    def build_order
      Order.new(order_number: "Order_#{SecureRandom.uuid}",
                total_price: 0)
    end

    def create_order_items(order)
      items_hash = JSON.parse(order_items)
      items_hash.each do |item_id, item_data|
        order.order_items.create(
          item_id: item_data['id'],
          quantity: item_data['quantity']
        )
      end
    end
  end
end
