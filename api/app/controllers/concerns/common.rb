module Common
  extend ActiveSupport::Concern

  private

  def reject_expired_user
    uid = request.headers[:uid]
    if uid.include?('@mokutube.guest')
      user = User.find_by(uid: uid)
      expired = (86400 < (Time.zone.now - user.created_at))
      render status: 401 if expired
    end
  end
end
