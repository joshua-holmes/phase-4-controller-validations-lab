class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_error_invalid_data

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_error_invalid_data error
    render json: {errors: { message: error.message }}, status: 422
  end
  
end
