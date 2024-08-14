module V1::Item
  class Index < ApplicationService
    def call
      get_items
    end

    private

    def get_items
      Item.all
    end
  end
end
