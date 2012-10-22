class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password
  has_many :albums, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 42 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end