class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:id])
        @comment = @post.comments.new(params[:comment])

        @comment.save
    end

    def new
        @post = Post.find(params[:id])
end
