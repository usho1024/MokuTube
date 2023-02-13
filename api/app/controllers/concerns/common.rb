module Common
  extend ActiveSupport::Concern

  private

  def reject_expired_user
    uid = request.headers[:uid]
    return unless uid.include?('@mokutube.guest')
    user = User.find_by(uid:)
    expired = (86_400 < (Time.zone.now - user.created_at))
    render status: :unauthorized if expired
  end
end
