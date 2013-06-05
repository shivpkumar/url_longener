class Url < ActiveRecord::Base
  before_save :generate_long_url


  protected

  def generate_long_url
    url_string = SecureRandom.hex(50)
    self.
  end
end
