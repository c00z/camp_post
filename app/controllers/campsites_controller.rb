class CampsitesController < ApplicationController

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

    wiki_url = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"
    page = Nokogiri::HTML(open(wiki_url))

         #
        #   # SCRAPING NATIONAL PARK NAME
        #   campsites = page.css("tr th a")
        #   locations = page.css("tr td small span a span span span.geo-dec")
        #   @campsite_array = []
        #   i = 0
         #
         #
        #   campsites.each do |c|
        #     park = {name: nil, location: nil}
        #     park["name"] = c
        #     park["location"] = locations[0]
        #     @campsite_array << park
        #   end
         #
         #
        #   @campsite_array.each do |x|
        #    p "THIS IS NEW THINGSSSS"
        #    p x
        #    natpark_loc = Campsite.find_or_create_by(name:x["name"])
        #      natpark_loc["location"] = x["location"]
        #      natpark_loc.save
        #  end

    #
    #       campsites.map do |a|
    #         campsite_name = a.text
    #         @campsite_array.push(campsite_name)
    #       end
    #
    #       locations.map do |el|
    #         campsite_loc = el.text
    #         @campsite_array.push(campsite_loc)
    #       end
    #
    # end




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

  def index
    @campsites = Campsite.all
  end


  def show
    @campsites = Campsite.find_by_id(params[:id])
    @user = User.all
    # render :show
  end

end

# campsite.save, break into array for space.
