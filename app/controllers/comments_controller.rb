class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(params[:comment])

        if @comment.save
            redirect_to posts_path
        else
            redirect_to posts_path, :alert => "You gotta have a body!"
        end
    end

    def new
        @post = Post.find(params[:post_id])

        respond_to do |format|
            format.html
            format.js
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @post = @comment.post

        @comment.destroy

        redirect_to posts_path, :alert => "Comment DESTROYED!"
    end
end
