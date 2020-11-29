class ShortenedUrl < ApplicationRecord

  validates :key, presence: true, uniqueness: true

  validates :full_url, presence: true, uniqueness: true

end
