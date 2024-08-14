module ::V1::Order
  class Index < ApplicationService
    def call
      get_orders
    end

    private

    def get_orders
      Order.includes(:order_items).where(deleted_at: nil)
    end
  end
end
