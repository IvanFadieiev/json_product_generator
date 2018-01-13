require 'json'
require 'faker'
require 'byebug'

Dir["#{File.dirname(__FILE__)}/generators/*.rb"].each { |file| load file }

class Generator
  class << self
    CATEGORIES_COUNT = 5
    PRODUCTS_COUNT = 10
    USERS_COUNT = 4

    $ID_COUNTER = 0
    $PRODUCTS_ARRAY = []

    def call
      File.open("./example.json","w") do |f|
        f.write(file_structure.to_json)
      end
    end

    private

    def file_structure
      {
        categories: CategoriesGenerator.call(entity_count: CATEGORIES_COUNT),
        products: ProductsGenerator.call(entity_count: CATEGORIES_COUNT, products_count: PRODUCTS_COUNT),
        users: UserGenerator.call(entity_count: USERS_COUNT)
      }
    end
  end
end

Generator.call
