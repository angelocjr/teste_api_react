class WebTest::DynamicController < WebTestController
  def initialize
    super
  end

  def define_dynamic
    return model.new
  end

  def define_dynamic_by_id(id)
    return model.find_by(id:id)
  end

  def get_all_dynamic
    return model.all
  end

  def aleatory_dynamic
    return model.order("RANDOM()").first
  end

  def create_dynamic_database(parameters)
    model.create_dynamic(parameters)
  end

  def update_dynamic_database(dynamic, parameters)
    model.update_dynamic(dynamic, parameters)
  end

  def delete_dynamic_database(dynamic)
    model.delete_dynamic(dynamic)
  end

  def exist_dynamic_by_name(name)
    return find_dynamic_by_name(name).present?
  end

  def find_dynamic_by_name(name)
    if model.where(name: name).present?
      return model.find_by(name: name)
    else
      return false
    end
  end

  def find_dynamic_by_string(string)
    if model.where("name LIKE ?","%#{string}%").present?
      return model.where("name LIKE ?","%#{string}%").pluck(:id)
    end
  end

  private

  def model
    return WebTest::Dynamic
  end
end
