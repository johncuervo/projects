module ::V1::Order
  class Show < ApplicationService
    attr_reader :order_id

    def initialize(order_id)
      @order_id = order_id
    end

    def call
      get_order
    end

    private

    def get_order
      Order.includes(:order_items).find_by(id: order_id, deleted_at: nil)
    end
  end
end
