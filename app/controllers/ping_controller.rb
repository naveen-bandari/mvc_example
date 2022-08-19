class PingController < ApplicationController
	def info
    render json: { message: 'this is demo project', version: '123.123.1' }, status: :ok
	end
end
