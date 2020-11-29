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
      redirect_to shortened_urls_path, notice: 'Url was successfully created.'
    else
      redirect_to new_shortened_url_path, flash: { error: url.errors }
    end
  end

  def destroy
    ShortenedUrl.find(params[:id]).destroy
    redirect_to shortened_urls_path, notice: 'Url was successfully destroyed.'
  end

  def visit_full_url
    url = ShortenedUrl.find(params[:id])
    UrlVisit.create!(shortened_url_id: url.id)
    redirect_to url.full_url
  end

  private def permitted_params
    params.require(:shortened_url).permit(:full_url)
  end
end
