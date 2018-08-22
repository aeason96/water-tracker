class ApplicationController < ActionController::API
  def hello_world
    render json: {message: 'Hello from rails!'}
  end
end
