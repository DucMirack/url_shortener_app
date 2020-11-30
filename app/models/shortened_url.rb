class ShortenedUrl < ApplicationRecord

  URL_KEY_LENGTH = 10

  validates :key, presence: true, uniqueness: true

  validates :full_url, presence: true, uniqueness: true

  has_many :visits, class_name: 'UrlVisit', dependent: :destroy, foreign_key: :url_id

  before_validation do
    self.key = generate_url_key
  end

  validate do
    errors.add(:full_url, "Cette URL n'existe pas ou n'a pas pu être jointe") if !is_url_regex
  end

  private def generate_url_key
    unique_value = false
    while unique_value == false
      key = SecureRandom.alphanumeric(URL_KEY_LENGTH)
      unique_value = true if ShortenedUrl.pluck(:key).exclude?(key)
    end
    key
  end

  private def is_url_regex
    !(self.full_url =~ /\A#{URI::regexp}\z/).nil?
  end
end
