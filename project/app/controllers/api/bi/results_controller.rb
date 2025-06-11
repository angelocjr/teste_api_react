# app/controllers/api/bi/results_controller.rb
class Api::Bi::ResultsController < Api::ResultController
  before_action :set_model

  def initialize
    super
  end
  
  def aggregate
    aggregate_response
  end

  private

  def aggregate_response
    ap 'aggregate_response'
  end

  def render_serializer(result)
    render json: Api::Bi::ResultSerializer.new(result).serializable_hash.to_json
  end
end
