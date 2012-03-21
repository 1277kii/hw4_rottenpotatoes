require 'spec_helper'

describe MoviesController do
  describe 'finding movies with the same director' do
    before :each do
      @fake_results = [mock('Movie'), mock('Movie')]
      @movie = FactoryGirl.build(:movie, :title => 'Star Wars', :rating => 'PG', :director => 'George Lucas')
    end
    it 'should call the model method that finds the movies with the same director' do
      @movie.should_receive(:find_with_same_director).and_return(@fake_results)
      get :same_director, {:id => '1'}
    end
    it 'should select the Similar Director template for rendering' do
      @movie.stub(:find_with_same_director).and_return(@fake_results)
      get :same_director, {:id => '1'}
      response.should render_template('same_director')
    end
    it 'should make the Resulting Movies available to that template' do
      @movie.stub(:find_with_same_director).and_return(@fake_results)
      get :same_director, {:id => '1'}
      assigns(:movies).should == @fake_results
    end
  end
end