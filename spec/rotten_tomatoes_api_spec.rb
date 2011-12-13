require 'spec_helper'
require 'rotten_tomatoes_api'
require 'ostruct'

describe RottenTomatoesApi do

  API_KEY = ENV['ROTTEN_TOMATOES_API_KEY']
  MOVIE_SEARCH = "api.rottentomatoes.com/api/public/v1.0/movies.json?q=&apikey=#{API_KEY}"

  it 'should return correct version string' do
    RottenTomatoesApi.version_string.should == "RottenTomatoesApi version #{RottenTomatoesApi::VERSION}"
  end

  it "should retrieve a list of films" do
    list = RottenTomatoesApi::MovieList.search("breathless")


    list.should_not be nil

    list.total.should == 6
    list.movies.should_not be nil

    list.movies.each do |movie|
      movie.title.should_not be nil
      movie.links.self.should_not be nil
    end


  end

  it "should retrieve the detail-information for a movie when requested" do
    list = RottenTomatoesApi::MovieList.search("breathless")

    movie = list.movies.first

    movie.details.title.should_not be nil
  end

end