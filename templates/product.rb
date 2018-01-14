require_relative '../helpers/product_data'
require_relative '../helpers/image'
require_relative './base_template'

class ProductTemplate < BaseTemplate
  include ProductData

  attr_accessor :id_counter, :category_id, :product_name, :product_price, :image

  def initialize(attrs = {})
    @id_counter = attrs[:id_counter]
    @category_id = attrs[:category_id]
    @product_name = fake_name
    @product_price = fake_price
    @image = fake_image
  end

  class << self
    def call(attrs = {})
      obj = new(attrs)
      template_for(obj)
    end

    private

    def template_for(obj)
      {
        id: obj.id_counter,
        categoryId: obj.category_id,
        productName: obj.product_name,
        productPrice: obj.product_price,
        productImg: obj.image
      }
    end
  end
end
