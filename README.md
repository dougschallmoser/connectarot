![connecTarot](https://user-images.githubusercontent.com/65590878/96668650-83687e80-1310-11eb-9d4c-fa2300d0ce52.png)

# connecTarot

connecTarot is designed to connect like-minded people together in the world of tarot. Users are able
to track, receive readings, and conduct tarot card readings for others. This application was built using Ruby on Rails.

[Live Demo](https://connectarot.herokuapp.com/)

[Demo Video](https://youtu.be/bd-E0IjS6to)


## Installation

To run this application in your local environment, please follow these steps:

```
1. Clone this repository
2. Run 'bundle install'
3. Run 'rails db:migrate'
4. Run 'rails db:seed'
5. If you would like to login through Github or Facebook, you will need keys/secrets
   from the developer sites. If you do not want to login this way, skip ahead to step 8.
6. Create a ".env" file
7. Inside the ".env" file, copy/paste the following four lines and insert your
   own keys/secrets in order to login with Omniauth third party authentication:

   GITHUB_KEY=insert_key_here
   GITHUB_SECRET=insert_secret_here
   FACEBOOK_KEY=insert_key_here
   FACEBOOK_SECRET=insert_secret_here

   In your Github/Facebook developer sites, you must also make your authorization callback url point to localhost:3000 as shown below:
   https://localhost:3000/auth/github/callback
   https://localhost:3000/auth/facebook/callback

8. Run 'rails s'
9. In your browser, goto http://localhost:3000/
```


## Contributing

Bug reports and pull requests are welcome on Github at:
https://github.com/dougschallmoser/connectarot-rails-app.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
 

## Authors

* **Doug Schallmoser** - *All work* - [DougSchallmoser](https://github.com/dougschallmoser)


## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT)


## Acknowledgments

I would like to acknowledge Sacred-Texts.com for providing the images of tarot cards, as well as BiddyTarot.com for providing the card meanings as part of the seed data.
