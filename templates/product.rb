require_relative '../helpers/product_data'
require_relative '../helpers/image'

class ProductTemplate
  class << self
    include Image
    include ProductData

    def call(attrs = {})
      id_counter = attrs[:id_counter]
      category_id = attrs[:category_id]

      {
        id: id_counter,
        categoryId: category_id,
        productName: product_name,
        productPrice: product_price,
        productImg: image
      }
    end
  end
end
