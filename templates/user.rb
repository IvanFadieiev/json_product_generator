class UserTemplate < BaseTemplate
  attr_accessor :id, :avatar

  def initialize(attrs = {})
    @id = attrs[:id]
    @avatar = fake_image
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
        userName: "Test User #{obj.id}",
        userAvatar: obj.avatar,
        admin: obj.id.eql?(1) # first user always will be admin
      }
    end
  end
end
