class HellosController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def index
    session_timestamp = session[:session_timestamp]

    render json: {
      current_timestamp: Time.current.strftime("%Y/%m/%d %H:%M:%S"),
      session_timestamp:,
    }
  end

  def create
    now = Time.current.strftime("%Y/%m/%d %H:%M:%S")
    session[:session_timestamp] = "session -> #{now}"

    head :ok
  end
end
