class Api::Users::DetailsController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def show
    render json: UserSerializer.new(current_user), status: :ok
  end

  def update
    byebug
  end

  def destroy
    byebug
  end
end
