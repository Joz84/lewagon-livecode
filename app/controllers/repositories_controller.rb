class RepositoriesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @batch = Batch.find_by(number: params[:batch_id].to_i)
    @repositories = @batch.repositories



    ingredient = 'chocolate'
    # url = "https://kitt.lewagon.com/camps/127/calendar"
    url = "assets/calendar_127.html"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.calendar-day-headers').each do |element|
      puts element.text.strip
    end
    raise

  end
end

