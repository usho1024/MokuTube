class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # APIモードではこの記述が必要
  include ActionController::Cookies
end
