class ProductsForCategoryGenerator
  class << self
    PRODUCTS_COUNT = 20
    @@id_counter = 0

    def call(params)
      super(params)
      @@products_array.flatten!
    end

    def entity_count
      PRODUCTS_COUNT
    end

    def yield_block(params)
      products_array = params[:products_array]
      i = params[:i]
      products_array << products_generator_for_category(i)
    end

    def products_generator_for_category(i)
      (1).upto(PRODUCTS_COUNT).map do
        @@id_counter += 1
        product_template(category_id)
      end
    end
  end
end

# (1).upto(PRODUCTS_COUNT).map do
#   @@id_counter += 1
#   product_template(category_id)
# end
