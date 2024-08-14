module ::V1::Order
  class Destroy < ApplicationService
    attr_reader :order_id

    def initialize(order_id)
      @order_id = order_id
    end

    def call
      delete_order
    end

    private

    def delete_order
      order = Order.find(order_id)
      if order.destroy
        [:destroyed, order]
      else
        [:unprocessable_entity, order]
      end
    rescue ActiveRecord::RecordNotFound => e
      [:not_found, e.message]
    end
  end
end
