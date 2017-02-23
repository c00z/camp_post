class CampsitesController < ApplicationController

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  def index
  wiki_url = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"
  page = Nokogiri::HTML(open(wiki_url))
  campsites = page.css("tr th a")
  @campsite_array = []
  campsites.map do |a|
    campsite_name = a.text
    @campsite_array.push(campsite_name)
  end
  end


  def show
    @campsites = Campsite.find_by_id(params[:id])
    # render :show
  end

end

# campsite.save, break into array for space.
