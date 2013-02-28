class PostsController < ApplicationController

    def index
        @posts = Post.all(:order => "created_at DESC")
        @post = Post.new

        if flash[:post]
            @default_text = flash[:post].body
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
        @posts = @posts = Post.all(:order => "created_at DESC")

        if @post.save
            respond_to do |format|
                format.html { redirect_to :root }
                format.js
            end
        else
            respond_to do |format|
                format.html { render action: "index"; flash[:post] = @post }
                format.js { render 'fail_create.js.erb'; flash.now[:alert] = "Your post didn't post!" }
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

end
