require 'json'
require 'faker'

class Generator
  class << self
    @@id_counter = 0
    @@products_array = []

    CATEGORIES_COUNT = 15
    PRODUCTS_COUNT = 20
    USER_COUNT = 5

    def call
      File.open("./example.json","w") do |f|
        f.write(file_structure.to_json)
      end
    end

    private

    def file_structure
      {
        categories: categories_generator,
        products: products_generator,
        users: user_generator
      }
    end

    # BEGIN: generators
    def products_generator
      (1).upto(CATEGORIES_COUNT) do |i|
        @@products_array << products_generator_for_category(i)
      end
      @@products_array.flatten!
    end

    def products_generator_for_category(category_id)
      (1).upto(PRODUCTS_COUNT).map do
        @@id_counter += 1
        product_template(category_id)
      end
    end

    def categories_generator
      (1).upto(CATEGORIES_COUNT).map do |i|
        category_template(i)
      end
    end

    def user_generator
      (1).upto(USER_COUNT).map do |i|
        user_template(i)
      end
    end
    # END: generators

    # BEGIN: templates
    def product_template(category_id)
      {
        id: @@id_counter,
        categoryId: category_id,
        productName: product_name,
        productPrice: product_price,
        productImg: image
      }
    end

    def category_template(i)
      {
        id: i,
        categoryName: "Fake category #{i}",
        categoryImg: image
      }
    end

    def user_template(i)
      {
        id: i,
        userName: "Test User #{i}",
        admin: i.eql?(1) # first user always will be admin
      }
    end
    # END: templates

    # BEGIN: fake data
    def image
      Faker::Avatar.image
    end

    def product_price
      Faker::Commerce.price.to_s
    end

    def product_name
      Faker::Commerce.product_name
    end
    # END: fake data
  end
end

Generator.call
