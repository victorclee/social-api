class PostsController < ApplicationController
  def create
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image_url, :body)
  end
end
