# Awesome recipes

This is a simple Sinatra app to grab a list of recipes from Contentful.

You need to set two environment variables used to access the Contentful API:
* `CONTENTFUL_SPACE_ID`: Space where recipes are stored
* `CONTENTFUL_ACCESS_TOKEN`: Access token to access the API

To get the app running all you have to do is:

```console
$ bundle install
$ bundle exec rackup config.ru
```

Tests can be run with rspec:

```console
bundle exec rspec spec
```

This app can also be accessed live on https://spoon-test-recipes.herokuapp.com/

That's it!
