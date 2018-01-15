class Generator
  class << self
    CATEGORIES_COUNT = CONFIG['CATEGORIES_COUNT'] || 1
    PRODUCTS_COUNT = CONFIG['PRODUCTS_COUNT'] || 1
    USERS_COUNT = CONFIG['USERS_COUNT'] || 1

    def call
      File.open('./json_files/example.json', 'w') do |f|
        f.write(file_structure.to_json)
      end
    end

    private

    def file_structure
      {
        categories: CategoriesGenerator.call(entity_count: CATEGORIES_COUNT),
        products: ProductsGenerator.call(entity_count: CATEGORIES_COUNT,
                                         products_count: PRODUCTS_COUNT),
        users: UserGenerator.call(entity_count: USERS_COUNT)
      }
    end
  end
end
