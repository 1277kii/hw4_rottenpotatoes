require 'spec_helper'

describe Movie do
  describe 'find other movies with the same director' do
    it 'should call Movie with director of given movie' do
      #TmdbMovie.should_receive(:find).with(hash_including :title => 'Inception')
      #Movie.find_in_tmdb('Inception')
    end
  end
end