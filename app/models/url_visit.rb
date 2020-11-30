class UrlVisit < ApplicationRecord

  belongs_to :url, class_name: 'ShortenedUrl', foreign_key: :url_id

  scope :created_between, lambda { |started_at, stopped_at|
    where(created_at: started_at..stopped_at)
  }

end

