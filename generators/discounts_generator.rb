class DiscountGenerator < BaseGenerator
  class << self
    private

    def yield_block(params)
      DiscountTemplate.call(id: params[:id])
    end
  end
end
