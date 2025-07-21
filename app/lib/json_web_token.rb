class JsonWebToken
  JWT_SECRET = Rails.application.credentials.dig(:secret_key_base)

  def self.encode(payload, exp = 12.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]

    HashWithIndifferentAccess.new(body)
  end
end
# This class provides methods to encode and decode JSON Web Tokens (JWTs).
# It uses the Rails application's secret key base for signing the tokens.
# The `encode` method takes a payload and an optional expiration time, while the `decode` method decodes a given token.
# The decoded token is returned as a `HashWithIndifferentAccess` for easier access to its keys.
