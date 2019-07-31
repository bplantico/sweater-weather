class User < ApplicationRecord
  before_create :set_api_key
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates_uniqueness_of :api_key

  private

  def set_api_key
    self.api_key = SecureRandom.urlsafe_base64.to_s
  end

end
