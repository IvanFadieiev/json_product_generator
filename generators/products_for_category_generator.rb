class ProductsForCategoryGenerator < BaseGenerator
  class << self
    private

    def yield_block(params)
      IdCounter.increment
      ProductTemplate.call(id_counter: IdCounter.current_id, category_id: params[:category_id])
    end
  end
end
