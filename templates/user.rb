class UserTemplate
  class << self
    def call(attrs = {})
      id = attrs[:id]

      {
        id: id,
        userName: "Test User #{id}",
        admin: id.eql?(1) # first user always will be admin
      }
    end
  end
end
