# spec/controllers/v1/orders_controller_spec.rb
require 'rails_helper'

RSpec.describe V1::OrdersController, type: :controller do
  let(:order_id) { 'order_id' }
  let(:orders) { 'orders' }
  let(:order) { 'order' }

  describe 'GET #index' do
    before do
      allow(::V1::Order::Index).to receive(:call).and_return([:ok, orders])

      get :index
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    before do
      allow(::V1::Order::Show).to receive(:call).with(order_id)
                                                .and_return([:ok, order])

      get :show, params: { id: order_id }
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:items_params) { ActionController::Parameters.new({ "5" => "2", "6" => "1" } ) }

    context 'when order creation is successful' do
      before do
        allow(::V1::Order::Create).to receive(:call).with(items_params)
                                                   .and_return([:created, double(id: order_id)])

        post :create, params: { order: { items: { "5" => "2", "6" => "1" } } }
      end

      it 'redirects to the created order page' do
        expect(response).to redirect_to(v1_order_path(order_id))
        expect(flash[:notice]).to eq('Order was successfully created.')
      end
    end

    context 'when order creation fails' do
      before do
        allow(::V1::Order::Create).to receive(:call).with(items_params)
                                                  .and_return([:error, nil])

        post :create, params: { order: { items: { "5" => "2", "6" => "1" } } }
      end

      it 'redirects to the items path with an alert' do
        expect(response).to redirect_to(v1_items_path)
        expect(flash[:alert]).to eq('There was an error creating the order.')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when order deletion is successful' do
      before do
        allow(::V1::Order::Destroy).to receive(:call).with(order_id)
                                                  .and_return([:destroyed, nil])

        delete :destroy, params: { id: order_id }
      end

      it 'redirects to the orders index page with a success notice' do
        expect(response).to redirect_to(v1_orders_path)
        expect(flash[:notice]).to eq('Order was successfully deleted.')
      end
    end

    context 'when order is not found' do
      before do
        allow(::V1::Order::Destroy).to receive(:call).with(order_id)
                                                  .and_return([:not_found, 'Order not found'])

        delete :destroy, params: { id: order_id }
      end

      it 'redirects to the orders index page with an alert about order not found' do
        expect(response).to redirect_to(v1_orders_path)
        expect(flash[:alert]).to eq('Order not found: Order not found')
      end
    end

    context 'when order deletion fails' do
      before do
        allow(::V1::Order::Destroy).to receive(:call).with(order_id)
                                                  .and_return([:error, nil])

        delete :destroy, params: { id: order_id }
      end

      it 'redirects to the orders index page with a generic error alert' do
        expect(response).to redirect_to(v1_orders_path)
        expect(flash[:alert]).to eq('Order could not be deleted.')
      end
    end
  end

end
