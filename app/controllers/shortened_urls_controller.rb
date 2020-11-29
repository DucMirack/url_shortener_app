class ShortenedUrlsController < ApplicationController
  def index
  end

  def new
    @url = ShortenedUrl.new
  end

  def create
    shortened_url = ShortenedUrl.create!(permitted_params)
    redirect_to shortened_urls_path
  end

  private def permitted_params
    params.require(:shortened_url).permit(:full_url)
  end
end
