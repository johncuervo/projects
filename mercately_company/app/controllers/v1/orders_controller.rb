class V1::OrdersController < ApplicationController
  def index
    @orders = get_orders
  end

  def show
    @order = get_order
  end

  def create
    status, result = create_order

    if status == :created
      redirect_to v1_order_path(result.id), notice: 'Order was successfully created.'
    else
      redirect_to v1_items_path, alert: 'There was an error creating the order.'
    end
  end

  def destroy
    status, result = delete_order

    if status == :destroyed
      redirect_to v1_orders_path, notice: 'Order was successfully deleted.'
    elsif status == :not_found
      redirect_to v1_orders_path, alert: "Order not found: #{result}"
    else
      redirect_to v1_orders_path, alert: 'Order could not be deleted.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_number, :total_price, :deleted_at)
  end

  def get_orders
    ::V1::Order::Index.call
  end

  def get_order
    ::V1::Order::Show.call(params[:id])
  end

  def create_order
    ::V1::Order::Create.call(params[:order][:items])
  end

  def delete_order
    ::V1::Order::Destroy.call(params[:id])
  end
end
