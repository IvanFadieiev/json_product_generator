module ProductData
  def fake_price
    Faker::Commerce.price.to_s
  end

  def fake_name
    Faker::Commerce.product_name
  end

  def fake_best_sales
    Faker::Number.number(1)
  end

  def fake_qty
    Faker::Number.number(2)
  end
end
