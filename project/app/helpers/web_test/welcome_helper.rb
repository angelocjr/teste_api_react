module WebTest::WelcomeHelper
  def media(dynamic)
    notes = dynamic.reviews.pluck(:note)
    media = notes.any? ? (notes.sum.to_f / notes.size).floor : 0
    return media
  end

  def method_define_action(params)
    params[:action] == 'update' ? result = :patch : result = :post
    return result
  end

  def active_readonly_by_action(params)
    params[:action] == 'update' ? true : false 
  end

  def url_define_action(params)
    params[:action] == 'update' ? web_test_welcome_update_dynamic_path(@dynamic) : web_test_welcome_create_dynamic_path
  end
end

