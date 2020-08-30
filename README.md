# Awesome recipes

This is a simple Sinatra app to grab a list of recipes from Contentful.

You need to set two environment variables used to access the Contentful API:
* `CONTENTFUL_SPACE_ID`: Space where recipes are stored
* `CONTENTFUL_ACCESS_TOKEN`: Access token to access the API

To get the app running all you have to do is:

```sh
$ bundle install
$ bundle exec rackup config.ru
```

Tests can be run with rspec:

```sh
bundle exec rspec spec
```

That's it!
