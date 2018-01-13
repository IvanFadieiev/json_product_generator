require 'byebug'
class BaseGenerator
  attr_accessor :entity_count

  class << self
    def call(params={})
      entity_count = new(params).entity_count

      (1).upto(entity_count).map do |i|
        yield_block(params.merge(id: i))
      end
    end

    private

    def yield_block(params)
      raise "#{__method__} method need to be defined in #{self.name}"
    end
  end

  def initialize(params)
    @entity_count = params[:entity_count]
    merge_attributes(params)
  end

  private

  def merge_attributes(params); end
end
