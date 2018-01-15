class BaseTemplate
  include Image

  def initialize(attrs = {})
    raise "#{__method__} method need to be defined in #{self.class}"
  end

  class << self
    def call(attrs = {})
      raise "#{__method__} method need to be defined in #{self.class}"
    end

    private

    def template_for(obj)
      raise "#{__method__} method need to be defined in #{self.class}"
    end
  end
end
