class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(params[:comment])

        @comment.save

        redirect_to @post
    end

    def new
        @post = Post.find(params[:id])
    end

    def destroy
        @comment = Comment.find(params[:id])
        @post = @comment.post

        @comment.destroy

        redirect_to @post
    end
end
