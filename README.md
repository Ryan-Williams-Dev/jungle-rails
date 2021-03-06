# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails.

## Screenshots
![HomePage](https://github.com/Ryan-Williams-Dev/jungle-rails/blob/master/docs/homepage.png?raw=true)
![Cart](https://github.com/Ryan-Williams-Dev/jungle-rails/blob/master/docs/cart.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create db
5. Run `bin/rake db:seed` to seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
