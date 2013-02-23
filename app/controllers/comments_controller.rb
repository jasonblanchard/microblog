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
end
