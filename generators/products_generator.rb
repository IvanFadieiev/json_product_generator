require_relative 'base_generator'
require_relative '../generators/products_for_category_generator'

class ProductsGenerator < BaseGenerator
  class << self
    def call(params={})
      super(params)
      $PRODUCTS_ARRAY.flatten!
    end

    private

    def yield_block(params)
      products_count = params[:products_count]
      category_id = params[:id]

      $PRODUCTS_ARRAY << ProductsForCategoryGenerator.call(entity_count: products_count, category_id: category_id)
    end
  end
end
