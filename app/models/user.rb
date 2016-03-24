class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_many :purchases

  has_many :orders

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }

  has_attached_file :avatar,
    styles: { thumbnail: 'x100' },
    convert_options: { all: '-quality 85 -strip' }

  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    attachment_file_name: { matches: [/png\Z/, /jpe?g\Z/] }
end
