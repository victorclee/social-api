class PostsController < ApplicationController
  def create
    if post = @user.posts.create(post_params)
      render json: { message: "Post created successfully", post: post }, status: :created
    else
      render json: { message: "Failed to create post", errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image_url, :body)
  end
end
