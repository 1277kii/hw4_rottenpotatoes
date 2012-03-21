require 'spec_helper'

describe Movie do
  describe 'find other movies with the same director' do
    it 'should make call to find movies with director of the given movie' do
      Movie.should_receive(:find).with(hash_including :director => 'George Lucas')
      movie = FactoryGirl.build(:movie, :title => 'Star Wars', :rating => 'PG', :director => 'George Lucas')
      movie.find_with_same_director
    end
  end
end