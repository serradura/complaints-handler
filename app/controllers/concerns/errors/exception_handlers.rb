# frozen_string_literal: true

module Errors
  module ExceptionHandlers
    ParameterMissing = -> exception do
      render status: :bad_request, json: Serializer[exception]
    end
  end
end
