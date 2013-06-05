class Url < ActiveRecord::Base
  validates :original_url, presence: true
  before_create :generate_long_url_hash

  protected

  def generate_long_url_hash
    url_string = SecureRandom.hex(50)
    self.long_url_hash = url_string
  end
end
