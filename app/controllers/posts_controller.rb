class PostsController < ApplicationController

    def index
        @posts = Post.all(:order => "created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(params[:post])
        
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

end
