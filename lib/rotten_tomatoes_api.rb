require 'rotten_tomatoes_api/version'
require 'httparty'
require 'recursive_open_struct'

module RottenTomatoesApi

  API_KEY = "sesenwn6zqegzseyhfw2bg49"
  MOVIES_SEARCH ='http://api.rottentomatoes.com/api/public/v1.0/movies.json'


  def self.version_string
      "RottenTomatoesApi version #{RottenTomatoesApi::VERSION}"
    end


  class Movie < RecursiveOpenStruct
    include HTTParty
    format :json

    def details
      RecursiveOpenStruct.new HTTParty.get(links.self, :query => {:apikey => API_KEY})
    end

  end

  class MovieList
    include HTTParty
    format :json

    attr_accessor :total, :movies, :raw

    def self.search(query)
      options =  {apikey: API_KEY, q: query}
      results = get(RottenTomatoesApi::MOVIES_SEARCH, :query => options)


      list = MovieList.new
      list.total = results["total"]
      list.raw = results

      movies = []
      results["movies"].each do |movie|
        movies << Movie.new(movie)
      end

      list.movies = movies
      list
    end
  end



end
