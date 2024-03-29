module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      uid = request.params[:uid]
      token = request.params[:token]
      client = request.params[:client]
      user = User.find_by(uid:)
      if user && user.valid_token?(token, client)
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
