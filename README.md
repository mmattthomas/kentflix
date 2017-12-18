# Kentflix

Kentflix is a little hobby app to rekindle my affection for Rails.  Its been a while so we'll see how it goes.
The intent is a simple application to log into where you can view a list of movies and check-in/check-out.

## Demo
You can see a demo at kentflix.herokuapp.com

## Roll your own
If you want to download and run, follow normal Rails deployment guidelines.
If you seed the database using seed.rb, it will create a default team named "MyFlix"
If you join this team by signing up, you won't be an admin... get to rails console and update your user record with admin=true.
Otherwise you can create a new team and add new movies manually.

Product Roadmap:

- [x] Bootstrap CSS
- [x] User Authentication (Devise)
- [x] Movie object list, forms
- [X] Show who is checked out to (or "Available")
- [X] Check-out/Check-in Buttons
- [X] Fix movie list to show who has what movie
- [X] Administrator (manually set)
- [X] Improve Admin/Edit forms (dates, foreign key check-out)
- [X] 1.0 ! RELEASE TO HEROKU
- [X] Pretty up "Available"/Checkedout columns in grid
- [X] If logged in, always go to movie page
- [X] Movie list has kent logo real small?
- [X] Rename or remove "Home" Nav link
- [X] Improve rating display as stars
- [X] Show how many movies you have checked out, and warn going over
- [X] User comments
- [X] Team functionality...join a team or create your own
- [ ] Sortable columns
- [ ] Bootstrap improvement for list on mobile page (show checkout in same column as title?)
- [ ] Notify Admin when movie is checked out/returned by someone
- [ ] Allow admin to turn off notifications
- [ ] Subscribe "get in line" as next person ABLE to check-out movie
- [ ] Auto notification to next-in-line person  
- [ ] Prevent checkout past [limit] movies
- [ ] User rating amalgamation/average 
- [ ] External data: Rotten Tomatoes score, image, imdb, etc.
- [ ] Embed video trailer
- [ ] Super slick viewer (scrolling list instead of basic `<table>`)
