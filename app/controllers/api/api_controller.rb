class Api::ApiController < ActionController::API
  include JsonResponse
  include ExceptionHandler
end
