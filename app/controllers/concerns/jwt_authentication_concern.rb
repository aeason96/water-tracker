# frozen_string_literal: true

module JwtAuthenticationConcern
  ALGORITHM = 'HS512'
  def create_token(user, expires = Time.now.to_i + 24 * 3600)
    payload = { user_id: user.id, role: user.role, exp: expires }
    JWT.encode(payload, '12345', ALGORITHM)
  end

  def fill_user_from_token
    authenticate_with_http_token do |token|
      begin
        payload = JWT.decode(token, '12345', true, algorithm: ALGORITHM)
        @user = User.find(payload[0]['user_id'])
      rescue JWT::DecodeError
        render status: :unauthorized, json: { errors: ['Please sign in again.'] }
      end
    end
  end
end
