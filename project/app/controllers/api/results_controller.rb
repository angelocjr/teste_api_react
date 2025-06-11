# app/controllers/api/results_controller.rb
class Api::ResultsController < ApiController
  before_action :set_model

  def initialize
    super
  end

  def index
    data = set_model.all
    render_serializer(data)
  end

  def show
    data = set_model.find(params[:id])
    render_serializer(data)
  end

  def create
    data = set_model.create!(result_params)
    render_serializer(data)
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

  def set_model
    return WebTest::Result
  end

  def render_serializer(data)
    render json: Api::ResultSerializer.new(data).serializable_hash.to_json
  end

  def result_params
    params.require(:result).permit(
      :name_result,
      :country_first,
      :total_case_first,
      :death_case_first,
      :country_last,
      :total_case_last,
      :death_case_last,
      :initial_date,
      :finish_date
    )
  end
end
