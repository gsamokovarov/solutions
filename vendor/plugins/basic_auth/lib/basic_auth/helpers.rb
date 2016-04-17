module BasicAuth
  module Helpers
    mattr_accessor :auth_class

    def login(auth)
      cookies.permanent.signed[:auth_id] = auth.id
    end

    def current_auth
      @current_auth ||= auth_class.constantize.find_by(id: cookies.permanent.signed[:auth_id])
    end
  end
end
