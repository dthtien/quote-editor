# frozen_string_literal: true

class Api::Users::SessionsController < Devise::SessionsController
  protect_from_forgery prepend: true

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        user: UserSerializer.new(resource)
      }, status: :ok
    else
      # current_user is not logged in successfully
      render json: {
        messages: ["Invalid Email or Password."],
      }, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
