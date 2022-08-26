# frozen_string_literal: true

module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  # TODO: Sort out the save problem and these exceptions

  # note these http codes:
  # there will be a message key inside of JSON
  included do
    rescue_from ActiveRecord::InvalidForeignKey do |e|
      render json: { message: e.message }, status: :conflict # 409
      # render json: { message: 'InvalidForeignKey on the table artilce on user_id'}, status: 409
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found # 404
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity # 422
      # render json: {message: 'Article name is required' }, status: 422
    end

    rescue_from JSON::ParserError do |e|
      render json: { message: "Invalid JSON: #{e.message}" }, status: :unprocessable_entity
      # render json: { message: 'Error parsing JSON' }, status: 422
    end

    rescue_from ArgumentError do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |e|
      render json: { message: e.message }, status: :not_found
    end

    # rescue_from Pundit::NotAuthorizedError do |e|
    #   policy_name = e.policy.class.to_s.underscore
    #   render json: { message: "Not allowed: #{policy_name}.#{e.query}" }, status: :forbidden
    # end
  end
end
