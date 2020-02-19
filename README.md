#General Assembly | WDI: Project 1

Overview
---
**on.BEAT** is a web application that allows users to create workout playlists based on song tempo, or "beats per minute" (BPM).  This app gives users the option to search for music based on BPM, genre, and mood by utilizing the EchoNest API.  Users can then choose songs from their search results to compile as many playlists as they'd like.  For most funtionality, the user must be signed in to the on.BEAT application.

on.BEAT is being developed for a project for the September 2014 Web Development Immersive course at General Assembly as a week-long sprint to model the Agile development process. 

Links
---
* Try on.BEAT for yourself and revolutionize your workout music experience!  You can find it here on [Heroku](https://onbeat.herokuapp.com/)
* on.BEAT [Trello](https://trello.com/b/rynlNxeb/wdi-project-1) Board
* on.BEAT [GitHub](https://github.com/eliza-irene/onbeat) page


Technologies Used
---
* Back end design and development using [Ruby 2.1.2](https://www.ruby-lang.org/en/), [Rails 4.1.6](http://weblog.rubyonrails.org/), and [Postgresql Database](http://www.postgresql.org/)
* Authentication & Authorization from scratch using b-crypt-ruby
* [theEchoNest API](http://developer.echonest.com/) and [HTTParty](https://github.com/jnunemaker/httparty)
* Testing using [rspec-rails](https://github.com/rspec/rspec-rails), [capybara](https://github.com/jnicklas/capybara), and [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
* Front-end design and development using [Twitter Bootstrap](http://getbootstrap.com/) 

User Story Examples
---
* As a user, I want to log in to my account.
* As a user, I want to sign up for an account with an email address and password.
* As a user, I want to be redirected to my profile page after sign in so that I can access or add to my playlists, search for new songs, or learn about BPM and workouts.
* As a user, I want to create new playlists.
* As a user, I want to be able to view my playlists to see each named list I have.
* As a user, I want to be able to view the songs in each playlist I have.
* As a user, I want to be able to delete individual songs from a playlist.
* As a user, I want to be able to delete an entire playlist.
* As a user, I want to perform a search for new songs by selecting parameters from drop down lists.
* As a user, I want to see a list of 15 search results as artist name and song name.
* As a user, I want to select songs from my search results and save them to one of my playlists.
* As a user, I want to learn about the benefit of working out to music at different tempos.
* As a user, I want to be able logout of my account.
<br />

Diagrams
---
Below are **mockups** for on.BEAT (created using [basalmiq](http://balsamiq.com/)) <br />

![Imgur](http://i.imgur.com/YeABrAv.png?1) ![Imgur](http://i.imgur.com/gKxBNgo.png?1) ![Imgur](http://i.imgur.com/RtlhLgS.png?1) ![Imgur](http://i.imgur.com/PFx7EOz.png?1) ![Imgur](http://i.imgur.com/18AvMJ8.png?1) ![Imgur](http://i.imgur.com/tIvvymP.png?1) ![Imgur](http://i.imgur.com/6rxihCO.png?1) ![Imgur](http://i.imgur.com/VhtEU6a.png?1) <br />

---

Below is the **ERD** for on.BEAT <br />

![Imgur](http://i.imgur.com/w2gCDYY.png?1)


