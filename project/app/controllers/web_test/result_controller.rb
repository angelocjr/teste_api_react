class WebTest::ReviewController < WebTestController
  def initialize
    super
  end

  def create_review_database(dynamic, parameters)
    model.create_review(dynamic, parameters)
  end

  def delete_review_database(review)
    model.delete_review(review)
  end

  private

  def model
    return WebTest::Review
  end
end
