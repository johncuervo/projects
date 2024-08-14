require 'rails_helper'

RSpec.describe V1::ItemsController, type: :controller do
  describe 'GET #index' do
    let(:items_list) { [double(id: 1, name: 'Item 1'), double(id: 2, name: 'Item 2')] }

    before do
      allow(::V1::Item::Index).to receive(:call).and_return(items_list)

      get :index
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:item_params) { { item: { name: 'Test Item', description: 'Test description', price: 19.99 } } }
    let(:item_id) { 1 }

    context 'when item creation is successful' do
      before do
        allow(controller).to receive(:create_item).and_return([:created, double(id: item_id)])

        post :create, params: item_params
      end

      it 'redirects to the created item page' do
        expect(response).to redirect_to(v1_item_path(item_id))
        expect(flash[:notice]).to eq('Item was successfully created.')
      end
    end

    context 'when item creation fails' do
      before do
        allow(controller).to receive(:create_item).and_return([:error, nil])

        post :create, params: item_params
      end

      it 'redirects to the items index page with an alert' do
        expect(response).to redirect_to(v1_items_path)
        expect(flash[:alert]).to eq('There was an error creating the item.')
      end
    end
  end
end
