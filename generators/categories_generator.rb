class CategoriesGenerator < BaseGenerator
  class << self
    private

    def yield_block(params)
      CategoryTemplate.call(id: params[:id])
    end
  end
end
