## About

This website was created in purpose of learning basic Ruby on Rails functionalities and its gems.

After singing in you can book virtual parking spot for given amount of time or cancel your reservation.

## Devise gem extended features

There are bunch of simple registration features implemented with usage of Devise gem:

* signing up with google or your email
* Mailer set up for email confirmation (check spam folder)
* Resetting password and recovering your account

## Application features
* parking spots and their state displayed on main page
* option to book selected parking spot after signing in
* user actions stored in database (postgres) for displaying history of spot actions
* cancelling a reservation
* background job for freeing up parking spot after reservation expires (redis + sidekiq)
* catching emails with mailtrap in development mode
* adding user comments for parking spots