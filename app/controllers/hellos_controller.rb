class HellosController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def index
    render json: { message: session[:message] }
  end

  def create
    session[:message] = params[:message]
    head :ok
  end
end
