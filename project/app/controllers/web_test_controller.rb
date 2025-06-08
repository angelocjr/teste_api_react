require 'logger'
class WebTestController < ApplicationController
  layout 'web_test'

  def error_name_exist?(model, parameters)
    if model.where(name: parameters[:name]).present?
      insert_error("Nome: #{parameters[:name]} já existe")
    end
  end

  def verify_text_params(text)
    if text.present?
      text = text.gsub(/[^a-zA-Z\sÀ-ÖØ-öø-ÿ]/, '').strip.downcase
      return text 
    end
  end

  def verify_field_present(field, string='')
    @erro = [] unless @erro.present?
    insert_error("Campo não está presente: #{string}") unless field.present?
    return field
  end

  def insert_error(text)
    @erro = [] unless @erro.present?
    @erro << text
  end

  def terminal_log
    Rails.logger = Logger.new(Rails.root.join("log/debug.log"))
    Rails.logger.level = Logger::DEBUG
    log("Log ativado!!!")
  end

  def log(txt)
    Rails.logger.debug txt
  end
end
