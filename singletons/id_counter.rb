require_relative './base_singleton'

class IdCounter < BaseSingleton
  attr_accessor :id

  def initialize
    @id = 0
  end

  class << self
    def current_id
      instance.id
    end

    def increment
      instance.id += 1
    end
  end
end
