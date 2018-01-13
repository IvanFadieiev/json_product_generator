require 'json'
require 'faker'
require 'byebug'

# TODO: remove to generators
Dir["#{File.dirname(__FILE__)}/templates/*.rb"].each { |file| load file }
Dir["#{File.dirname(__FILE__)}/generators/*.rb"].each { |file| load file }

class Generator
  class << self
    @@id_counter = 0
    @@products_array = []

    CATEGORIES_COUNT = 15
    PRODUCTS_COUNT = 20
    USERS_COUNT = 3

    def call
      File.open("./example.json","w") do |f|
        f.write(file_structure.to_json)
      end
    end

    private

    def file_structure
      {
        categories: CategoriesGenerator.call(entity_count: CATEGORIES_COUNT),
        products: products_generator,
        users: UserGenerator.call(entity_count: USERS_COUNT)
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
    # END: generators
  end
end

Generator.call
