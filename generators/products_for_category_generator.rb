require_relative 'base_generator'
require_relative '../templates/product'

class ProductsForCategoryGenerator < BaseGenerator
  class << self
    private

    def yield_block(params)
      $ID_COUNTER += 1
      ProductTemplate.call(id_counter: $ID_COUNTER, category_id: params[:category_id])
    end
  end
end
