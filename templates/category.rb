class CategoryTemplate < BaseTemplate
  attr_accessor :id, :image

  def initialize(attrs = {})
    @id = attrs[:id]
    @image = fake_image
  end

  class << self
    def call(attrs = {})
      obj = new(attrs)
      template_for(obj)
    end

    private

    def template_for(obj)
      {
        id: obj.id,
        categoryName: "Fake category #{obj.id}",
        categoryImg: obj.image
      }
    end
  end
end
