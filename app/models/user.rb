class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
end
