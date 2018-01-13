require 'json'
require 'faker'
require 'byebug'

Dir["#{File.dirname(__FILE__)}/templates/*.rb"].each { |file| load file }

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
        ProductTemplate.call(id_counter: @@id_counter, category_id: category_id)
      end
    end

    def categories_generator
      (1).upto(CATEGORIES_COUNT).map do |i|
        CategoryTemplate.call(id: i)
      end
    end

    def user_generator
      (1).upto(USER_COUNT).map do |i|
        UserTemplate.call(id: i)
      end
    end
    # END: generators
  end
end

Generator.call
