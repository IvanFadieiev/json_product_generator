class ProductsGenerator < BaseGenerator
  class << self
    def call(params={})
      super(params)
      ProductsArray.flatten!
    end

    private

    def yield_block(params)
      products_count = params[:products_count]
      category_id = params[:id]

      ProductsArray.add ProductsForCategoryGenerator.call(entity_count: products_count, category_id: category_id)
    end
  end
end
