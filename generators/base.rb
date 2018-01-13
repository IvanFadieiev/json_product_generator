module Generator
  class Base
    class << self
      def call(params)
        (1).upto(entity_count) do |i|
          yield_block(params.merge(i: i))
        end
      end

      private

      def entity_count
        raise NoImplenentedError, "#{__method__} method need to be defined in #{self.name}"
      end

      def yield_block(params)
        raise NoImplenentedError, "#{__method__} method need to be defined in #{self.name}"
      end
    end
  end
end
