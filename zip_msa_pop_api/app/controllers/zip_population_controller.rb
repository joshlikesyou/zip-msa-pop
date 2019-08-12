class ZipPopulationController < ApplicationController
  def show
    result = Query::ZipMsaQuery.perform(params[:zip])
    render json: result
  rescue ArgumentError => e
    message = { status: 'error', code: 422, message: e.message }.to_json
    render json: message, status: 422
  end
end
