class ShortenedUrlsController < ApplicationController
  before_action :find_url, only: [:show, :destroy]

  def index
    @urls = ShortenedUrl.all
  end

  def show
    stop_date = DateTime.now
    start_date = stop_date - 1.hour
    visits = @url.url_visits.created_between(start_date, stop_date)
    @datas = visits.group("CONCAT(
                         EXTRACT(hour FROM created_at),
                         'h',
                         EXTRACT(minutes FROM created_at))")
                  .count
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
    @url.destroy
    redirect_to shortened_urls_path, notice: 'Url was successfully destroyed.'
  end

  def visit_full_url
    url = ShortenedUrl.find_by(key: params[:key])
    UrlVisit.create!(shortened_url_id: url.id)
    redirect_to url.full_url
  end

  private def permitted_params
    params.require(:shortened_url).permit(:full_url)
  end

  private def find_url
    @url = ShortenedUrl.find(params[:id])
  end
end
