class Url < ActiveRecord::Base
  validates :original_url, presence: true
  validate :url_must_begin_with_http
  before_create :generate_long_url_hash



  protected

  def generate_long_url_hash
    url_string = SecureRandom.hex(50)
    self.long_url_hash = url_string
  end

  def url_must_begin_with_http
    unless !!self.original_url.match(/^http/)
      errors.add(:original_url, "must begin with HTTP")
    end
  end
end
