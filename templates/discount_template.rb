class DiscountTemplate < BaseTemplate
  class << self
    def call(attrs = {})
      discount_template
    end

    private

    def discount_template
      {
        id: 1,
        categoryId: 1,
        productId: nil
      }
    end
  end
end
