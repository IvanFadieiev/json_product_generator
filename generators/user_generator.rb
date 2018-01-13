require_relative 'base_generator'
require_relative '../templates/user'

class UserGenerator < BaseGenerator
  class << self
    private

    def yield_block(params)
      UserTemplate.call(id: params[:id])
    end
  end
end
