require_relative '../helpers/image'

class CategoryTemplate
  class << self
    include Image

    def call(attrs = {})
      id = attrs[:id]

      {
        id: id,
        categoryName: "Fake category #{id}",
        categoryImg: image
      }
    end
  end
end
