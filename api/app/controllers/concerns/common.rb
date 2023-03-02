module Common
  extend ActiveSupport::Concern

  private

  ONE_DAY_SEC = 86400

  # 作成から24時間経過したゲストユーザーに401を返す
  def reject_expired_user
    uid = request.headers[:uid]
    return unless uid.include?('@mokutube.guest')

    user = User.find_by(uid:)
    elapsed_sec = Time.zone.now - user.created_at
    result = ONE_DAY_SEC < elapsed_sec
    render status: :unauthorized if result
  end
end
