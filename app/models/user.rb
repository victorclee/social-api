class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email, :username
  validates_presence_of :email, :password, :username, :first_name, :last_name

  has_many :posts, dependent: :destroy

  def as_json(options = {})
    super(options.merge(only: [ :id, :first_name, :last_name, :username ]))
  end
end
