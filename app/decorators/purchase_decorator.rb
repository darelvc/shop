class PurchaseDecorator < Draper::Decorator
  delegate_all

  decorates_association :product

  def as_json *args
    super only: [:id, :quantity], methods: [:product]
  end
end
