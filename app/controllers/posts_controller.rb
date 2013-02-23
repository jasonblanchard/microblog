class PostsController < ApplicationController

    def index
        @posts = Post.all(:order => "created_at DESC")
        @post = Post.new

        if session[:post]
            @default_text = session[:post].body
        else
            @detault_text = ''
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments.all(:order => "created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params[:post])

        if @post.save
            session.delete(:post)
            redirect_to :root
        else
            redirect_to :root, :alert => "Your post is too long!"
            session[:post] = @post
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

end
