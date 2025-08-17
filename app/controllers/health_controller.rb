class HealthController < ApplicationController
  def show
    render json: {status: 'ok', time: Time.now.utc.iso8601}
  end
end
