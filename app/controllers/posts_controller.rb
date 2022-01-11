class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_error_invalid_data

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_error_invalid_data error
    render json: {errors: { message: error.message }}, status: 422
  end

end
