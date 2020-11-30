class UrlVisit < ApplicationRecord

  belongs_to :shortened_url

  scope :created_between, lambda { |started_at, stopped_at|
    where(created_at: started_at..stopped_at)
  }

end

