class ProductsArray < BaseSingleton
  attr_accessor :array

  def initialize
    @array = []
  end

  class << self
    def add(new_array)
      instance.array << new_array
    end

    def flatten!
      instance.array.flatten!
    end
  end
end
