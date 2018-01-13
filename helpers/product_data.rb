module ProductData
  def product_price
    Faker::Commerce.price.to_s
  end

  def product_name
    Faker::Commerce.product_name
  end
end
