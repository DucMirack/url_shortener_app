class ShortenedUrlsController < ApplicationController
  def index
    @urls = ShortenedUrl.all
  end

  def new
    @url = ShortenedUrl.new
  end

  def create
    url = ShortenedUrl.new(permitted_params)
    if url.save
      redirect_to shortened_urls_path
    else
      redirect_to new_shortened_url_path, flash: { error: url.errors }
    end
  end

  private def permitted_params
    params.require(:shortened_url).permit(:full_url)
  end
end
