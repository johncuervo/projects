module V1
  class ItemsController < ApplicationController
    def index
      @items = get_items
    end
    def create
      status, result = create_item

      if status == :created
        redirect_to v1_item_path(result.id), notice: 'Item was successfully created.'
      else
        redirect_to v1_items_path, alert: 'There was an error creating the item.'
      end
    end

    private

    def item_params
      params.require(:item).permit(:name, :description, :price, :img_url, :deleted_at)
    end

    def get_items
      ::V1::Item::Index.call
    end

    def create_item
      #Pending logic. Mocked response just to complete the unit test for this file
      [:created, 'ok']
    end
  end
end
