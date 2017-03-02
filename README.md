# Camp_Post - [Live Link](https://camp-post.herokuapp.com/)

<img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="100">

## Camp_Post

<i> Full Stack Rails App built for the final WDI Project </i>

Camp_Post was built as a way for those who enjoy camping and backpacking to share their experiences.

Users will be able to create a profile, create new reviews, bookmark future trips, search national parks, rate campsites and create a camping list.

Feel free to fork / star / watch for your own personal use.

See the published project at [camp-post.herokuapp.com/](https://camp-post.herokuapp.com/)!

## Future Development

-Mobile responsive.

-Allow admins to create and edit new campsite locations.

-Plot map all locations.

-Allow users to add images to their reviews.

-Sort by top rated campsites.

-Utilize APIs for weather and twitter.

#Entity-Relationship Diagram
<img src="http://i.imgur.com/Ob1HFL7.png" width="800">

User table: Main database model for users and sessions

Campsite table: Stores all campsites information

CampingList table: Allows users to create and save camping lists

Review table: Stores reviews to both users and locations

CampsitesUser table: Allows users to bookmark campsites for future use

Rate, Cache, & Overall Average tables: Allow users to rate campsites

#Technologies Used   

####Languages:
HTML5, JavaScript, CSS, Ruby
####External Libraries:
jQuery, Materialize
####Frameworks:
Rails


## Code I'm Proud Of...
This piece of code created the web scraper used to pull in every National Park from Wikipedia.
<hr>
```ruby
#campsites_controller
wiki_url = "https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"
page = Nokogiri::HTML(open(wiki_url))

campsites = page.css("tr th a")
@campsite_array = []
campsites.map do |a|
  campsite_name = a.text
  @campsite_array.push(campsite_name)
end
@campsite_array[4...63].each do |el|
  natpark = Campsite.find_or_create_by(name: el)
end

#campsites_show
<%  @campsites[0...63].each do |p| %>
  <h5><%= link_to "#{p.name}", campsite_path(p) %></h5>
  <br>
<% end % >
```
This piece of code allows for users to search the campsite index.
<hr>
```ruby
# campsites_controller
def index
  @campsites = Campsite.all
  # search functionality
  if params[:search]
      @campsites = Campsite.search(params[:search])
    else
      @campsites = Campsite.all
  end
  # pagination
  @campsites = @campsites.paginate(:page => params[:page], :per_page => 12, :total_entries => 60)
end

# campsites model
def self.search(search)
  where("name ILIKE ?", "%#{search}%")
end

# campsites_index
<%= form_tag(campsites_path, :method => "get", id: "search-form") do %>
<%= text_field_tag :search, params[:search], placeholder: "Search Parks" %>
<%= submit_tag "Search", class: "btn btn-danger pic-large", id:"buttonz" %>
<% end %>
<% if @campsites.present? %>
<% else %>
  <p>There are no campsites containing the term(s) <%= params[:search] %>.</p>
<% end % >

```
## Screen Shots
<img src="http://i.imgur.com/DHyO7bj.jpg" width="600">
<img src="http://i.imgur.com/Qle6qms.jpg" width="600">
<img src="http://i.imgur.com/By7kEra.jpg" width="600">
<img src="http://i.imgur.com/CWAqAfk.png" width="600">
<hr>

## Trello Board
[Wireframes, Database models & Sprint Planning](https://trello.com/b/HRMoxsHy/final-project)

## Contributors
[Zach Cusimano](https://github.com/c00z)

## Resources
[Nokogiri as a Web Scraper](https://medium.com/loriscode/nokogiri-wikipedia-scraping-4eb4e809b0a4#.rm8naz87a)<br>
[Search in Rails](https://medium.com/loriscode/search-for-rails-b7aec9d9d0c0#.y2cwolyvp)<br>
[Bookmarking Rails](https://medium.com/loriscode/bookmarking-feature-in-rails-28c31bf67abe#.ssa45bhtd)<br>
[Rating System](https://www.sitepoint.com/ratyrate-add-rating-rails-app/)
