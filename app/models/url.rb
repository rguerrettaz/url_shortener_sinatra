class Url < ActiveRecord::Base

  before_create :create_shortened
  

  validates :original, :uniqueness => true
  validate  :real_url?



  def real_url?
    unless (original =~ /http:\/\/[\w\d]*\.[a-z]{2,5}/i) >= 0
      errors.add(:original, "not properly formatted url")
    end
  end

  private

  def create_shortened
    self.shortened = ((0..5).map { ('a'..'z').to_a.sample }.join)
  end

end

# Url.create(original: "http://hansenschuppe.info/vicky", shortened: 'seioso')
