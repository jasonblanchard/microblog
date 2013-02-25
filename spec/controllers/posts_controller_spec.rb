require 'spec_helper'

describe PostsController do

    describe "Showing all posts" do
        it "should show all posts on the index page" do
            Post.stub(:index)
            get :index
            response.should render_template('index')
        end

    end

end
