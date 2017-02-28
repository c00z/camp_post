class CampsitesController < ApplicationController

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

    wiki_url = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"
    page = Nokogiri::HTML(open(wiki_url))

    # SCRAPING NATIONAL LOCATION
    locations = page.css("tr td small span a span span span.geo-dec")
    @locations_array = []
    locations.map do |el|
      campsite_loc = el.text
      @locations_array.push(campsite_loc)
    end
    @locations_array.each do |x|
      p "THIS IS LOCATIONNNN"
      p x
      natpark_loc = Campsite.find_or_create_by(location: x)
    end

    # SCRAPING NATIONAL PARK NAME
    campsites = page.css("tr th a")
    @campsite_array = []
    campsites.map do |a|
      campsite_name = a.text
      @campsite_array.push(campsite_name)
    end
    @campsite_array[4...63].each do |el|
      puts el
      p "THIS IS ELLLLL"
      p el
      # creates unique campsite name in DB
      natpark = Campsite.find_or_create_by(name: el)
      # el = el.gsub!(/[!@%&♠]/,'')
      # natpark.save
    end

    p "THIS IS CAMPSITE ARRAY"
    p @campsite_array
    p "THIS IS LOCATIONS ARRAY"
    p @locations_array

    # obj_array = Array.new[60] { |i| {loc}}
    #   @locations_array.each_with_index |loc, i|
    #   obj_array[i] = {location: loc, name: campsite_array[i]}
    #
    #   p obj_array



  def index
    @campsites = Campsite.all
    if params[:search]
        @campsites = Campsite.search(params[:search])
      else
        @campsites = Campsite.all
    end
    @campsites = @campsites.paginate(:page => params[:page], :per_page => 30, :total_entries => 60)
  end


  def show
    @campsites = Campsite.find_by_id(params[:id])
    @user = User.all
    # render :show
  end

end

# campsite.save, break into array for space.
