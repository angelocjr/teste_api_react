# app/controllers/api/results_controller.rb
class Api::ResultsController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :set_model

  def initialize
    super
  end

  def index
    data = set_model.where(benchmark_id: params[:benchmark_id])
    render_serializer(data)
  end

  def show
    data = set_model.find(params[:id])
    render_serializer(data)
  end

  def create(params, benchmark)
    set_name(params)
    set_model.create_result(params, benchmark) unless set_model.find_by(name_result: params[:name_result])
  end

  def update
    data = set_model.find(params[:id])
    data.update!(result_params)
    render_serializer(data)
  end

  def destroy
    data = model_result.find(params[:id])
    data.destroy
    head :no_content
  end

  private
  
  def set_name(params)
    params[:name_result] = "#{params[:start_date]} a #{params[:end_date]}"
  end

  def set_model
    return WebTest::Result
  end

  def render_serializer(data)
    render json: Api::ResultSerializer.new(data).serializable_hash.to_json
  end
end
