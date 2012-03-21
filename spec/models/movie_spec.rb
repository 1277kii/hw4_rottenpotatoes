require 'spec_helper'

describe Movie do
  describe 'find other movies with the same director' do
    it 'should make call to find movies with director of the given movie' do
      movie = FactoryGirl.build(:movie, :id => 1, :title => 'Star Wars', :rating => 'PG', :director => 'George Lucas')
      Movie.should_receive(:find).with(1).and_return(movie)
      Movie.should_receive(:where).with('director = :director and id != :id', hash_including(:director => movie.director, :id => movie.id))
      Movie.find_others_with_same_director(1)
    end
  end
end