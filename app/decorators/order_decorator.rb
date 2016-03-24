class OrderDecorator < Draper::Decorator
  delegate_all

  decorates_association :purchases

  def as_json *args
    super only: [:id], methods: [:purchases]
  end
end
