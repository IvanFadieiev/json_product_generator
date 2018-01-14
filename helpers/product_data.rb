module ProductData
  def fake_price
    Faker::Commerce.price.to_s
  end

  def fake_name
    Faker::Commerce.product_name
  end
end
