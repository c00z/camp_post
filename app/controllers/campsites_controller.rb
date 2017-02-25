class CampsitesController < ApplicationController

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

    wiki_url = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"
    page = Nokogiri::HTML(open(wiki_url))

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

    # SCRAPING NATIONAL PARK IMAGE
    campsites_img = page.css("tr td a.image img")
    @img_array = []
      campsites_img.map do |z|
        p "THIS IS IMG"
        p campsites_img
        image = z

        @img_array.push(image)
      end

    @img_array.each do |img|
      puts img
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
