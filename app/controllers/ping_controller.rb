# frozen_string_literal: true

class PingController < ApplicationController
  def info
    render json: { message: 'this is demo project', version: '123.123.1' }, status: :ok
  end

  def error_info
    render json: { message: 'Handling the common error responses', error_codes: [404, 422, 200, 201, 204] }
  end
end
