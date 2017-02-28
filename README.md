# Camp_Post - [Live Link](google.com/)

<img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="100">

## Camp_Post

<i> Full Stack Rails App built for the final WDI Project </i>

Camp_Post was built as a way for those who enjoy camping and backpacking to share their experiences.

Users will be able to create a profile, create new reviews, bookmark future trips and create a camping list.

Feel free to fork / star / watch for your own personal use.

See the published project at [xxxxx.herokuapp.com](https://ga-hackathon.herokuapp.com/)!

## Future Development

Allow admins to create and edit hackathon events. Automate team assignments equally based on students selected class. Add the ability for ideas to contain multimedia.  

#Entity-Relationship Diagram
<img src="http://i.imgur.com/iAykvCf.png" width="800">

####User table: Main database model for users and sessions
####Campsite table: Stores all campsites information
####CampingList table: Allows users to create and save camping lists
####Review table: Stores reviews to both users and locations
####CampsitesUser table: Allows users to bookmark campsites for future use

#Technologies Used   

####Languages:
HTML5, JavaScript, CSS, Ruby
####External Libraries:
jQuery, Materialize
####Frameworks:
Rails


## Code I'm Proud Of...
This piece of code creates our RSVP feature on the event show page.
<hr>
```ruby
#event_user controller
def build
    @event = Event.friendly.find(params[:event_id])
    @user = current_user
    @event.users << @user
    redirect_to :back
end

```

## Screen Shots
<img src="http://i.imgur.com/DHyO7bj.jpg" width="600">
<hr>

## Trello Board
[Wireframes, Database models & Sprint Planning](https://trello.com/b/O2z9teqw/project-2)

## Contributors
[Zach Cusimano](https://github.com/c00z)

## Resources
[Nokogiri as a Web Scraper](https://medium.com/loriscode/nokogiri-wikipedia-scraping-4eb4e809b0a4#.rm8naz87a)<br>
[Search in Rails](https://medium.com/loriscode/search-for-rails-b7aec9d9d0c0#.y2cwolyvp)
