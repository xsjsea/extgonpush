class User < ApplicationRecord

def getcreator
	@users = User.all
end
def authenticate(submitted_password)
  return self.has_password?(submitted_password)
end


end
