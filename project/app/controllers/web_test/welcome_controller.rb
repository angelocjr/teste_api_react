class WebTest::WelcomeController < WebTestController
  before_action :get_users
  before_action :terminal_log
  before_action :define_dynamic
  before_action :define_dynamic_by_params, only: [:delete, :delete_dynamic, :update, :update_dynamic]
  before_action :get_all_dynamic, only: [:index]
  before_action :aleatory_dynamic, only: [:aleatory_din]
  
  def initialize
    super
  end
  
  def index
    log("Acesso welcome page")
  end

  def create
    log("Acesso create page")
  end

  def update
    log("Acesso update page, dinamica id:#{@dynamic.id} selecionada.")
  end

  def delete
    log("Acesso delete page, dinamica id:#{@dynamic.id} selecionada.")
  end

  def create_dynamic 
    log("Começo do fluxo do create_dynamic")
    parameters = take_and_treat_parameters
    log("Parametros tratados para criar usuário: #{parameters}")
    error_name_exist?(parameters)
    log("Verificando se o nome existe: #{error_name_exist?(parameters)}") 
    
    if @erro.present?
      log("Erros encontrados: #{@erro}")
      redirect_to web_test_welcome_path
    else
      create_dynamic_database(parameters)
      dynamic = find_dynamic_by_name(parameters[:name])
      log("Dinamica id criada com sucesso: #{dynamic.id}")
      create_review_database(dynamic, parameters)
      log("Review criada para dinamica id:#{dynamic.id}, redirecionando welcome_path")
      log("Fim do fluxo do create_dynamic")
      redirect_to web_test_welcome_path
    end
  end

  def update_dynamic
    log("Começo do fluxo do update_dynamic")
    parameters = take_and_treat_parameters
    log("Parametros tratados para atualizar usuário: #{parameters}")
    error_name_dont_exist?(parameters)
    log("Verificando se o nome não existe: #{error_name_dont_exist?(parameters)}")
    if @erro.present?
      log("Erros encontrados: #{@erro}")
      redirect_to web_test_welcome_path, notice: @erro
    else
      dynamic = find_dynamic_by_name(parameters[:name])
      log("Dynamica id selecionada para atualização: #{dynamic.id}")
      update_dynamic_database(dynamic, parameters)
      log("Dynamica id atualizada: #{dynamic.id}")
      create_review_database(dynamic, parameters)
      log("Criado uma nova review para dynamica id: #{dynamic.id}, redirecionando welcome_path")
      log("Fim do fluxo do update_dynamic")
      redirect_to web_test_welcome_path
    end
  end

  def delete_dynamic
    log("Começo do fluxo do delete_dynamic")
    delete_all_reviews
    log("Todas as Reviews da dinamica id: #{@dynamic.id} apagados")
    log("Apagando a dinamica id:#{@dynamic.id}")
    delete_dynamic_database
    log("Dinamica apagada, redirecionando welcome_path")
    log("Fim do fluxo do delete_dynamic")
    redirect_to web_test_welcome_path
  end

  def aleatory_din
    log("Selecionado dinamica aleatoria de id: #{@dynamic.id}")
    redirect_to web_test_welcome_path(@dynamic)
  end

  def search_din
    log("Pesquisa dos caracteres #{params[:search]} e armazenando pesquisa no redis")
    result_search = find_dynamic_by_string(params[:search])
    $redis.set("return_string: #{params[:search]}", "return_id: #{result_search}")
    redirect_to web_test_welcome_path(result_search)
  end

  private

  def get_users
    @list_users = WebTest::User::HASH_USER_MAPPER
  end

  def cont_dynamic
    return WebTest::DynamicController.new
  end

  def cont_review
    return WebTest::ReviewController.new
  end

  def define_dynamic
    @dynamic = cont_dynamic.define_dynamic
  end

  def define_dynamic_by_id(id)
    return cont_dynamic.define_dynamic_by_id(id)
  end

  def define_dynamic_by_params
    @dynamic = cont_dynamic.define_dynamic_by_id(params[:format])
  end

  def get_all_dynamic
    if params[:format].present?
      @dynamics = [define_dynamic_by_id(params[:format])]
    else
      @dynamics = cont_dynamic.get_all_dynamic
    end
  end

  def aleatory_dynamic
    @dynamic = cont_dynamic.aleatory_dynamic
  end

  def find_dynamic_by_name(name)
    return cont_dynamic.find_dynamic_by_name(name)
  end

  def find_dynamic_by_string(string)
    return cont_dynamic.find_dynamic_by_string(string)
  end

  def error_name_exist?(parameters)
    if cont_dynamic.exist_dynamic_by_name(parameters[:name])
      insert_error("Nome: #{parameters[:name]} já existe")
    end
  end

  def error_name_dont_exist?(parameters)
    unless cont_dynamic.exist_dynamic_by_name(parameters[:name])
      insert_error("Nome: #{parameters[:name]} não existe")
    end
  end

  def create_dynamic_database(parameters)
    cont_dynamic.create_dynamic_database(parameters)
  end

  def update_dynamic_database(dynamic, parameters)
    cont_dynamic.update_dynamic_database(dynamic, parameters)
  end

  def delete_dynamic_database
    cont_dynamic.delete_dynamic_database(@dynamic)
  end

  def create_review_database(dynamic, parameters)
    cont_review.create_review_database(dynamic, parameters)
  end

  def delete_all_reviews
    @dynamic.reviews.each do |review|
      cont_review.delete_review_database(review)
    end
  end

  def params_dynamic
    params.require(:web_test_dynamic).permit(
      :name,
      :description,
      :note,
      :comment
    )
  end

  def take_and_treat_parameters
    name = params_dynamic["name"]
    description = params_dynamic["description"]
    note = params_dynamic["note"]
    comment = params_dynamic["comment"]

    @treat_array_parameters = {
      :name => verify_text_params(verify_field_present(name, 'name')),
      :description => verify_text_params(verify_field_present(description, 'description')),
      :note => verify_field_present(note, 'note'),
      :comment => verify_text_params(verify_field_present(comment, 'comment'))
    }
  end
end
