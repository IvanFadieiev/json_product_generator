module Generators
  class Products
    class << self
      CATEGORIES_COUNT = 20
      @@products_array = 0

      def call(params)
        super(params)
        @@products_array.flatten!
      end

      def entity_count
        CATEGORIES_COUNT
      end

      def yield_block(params)
        products_array = params[:products_array]
        i = params[:i]
        products_array << products_generator_for_category(i)
      end

      def products_generator_for_category(i)
        Generators::ProductsForCategory.call(i: i)
      end
    end
  end
end
