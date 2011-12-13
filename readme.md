Rotten Tomatoes API
===================

A simple, experimental wrapper around the Rotten Tomatoes API, that allows you to search for movies (http://developer.rottentomatoes.com/).
Uses [Httparty](https://github.com/jnunemaker/httparty) for accessing the json-api for Rotten Tomatoes.


Setup
-----

Add your API-Key to your enviroment using

```ruby
ROTTEN_TOMATOES_API_KEY=["sesenwn6zqegzseyhfw2bg49"]

```

Then add

```ruby

gem "rotten_tomatoes_api"
```
to your gemfile.

Example
------
```ruby
movie_list = RottenTomatoesApi::MovieList.search("breathless")

movie_list.movies.each do |movie|
    puts movie.title
    puts movie.posters.original
end
```


