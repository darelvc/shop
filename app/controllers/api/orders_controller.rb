class Api::OrdersController < Api::BaseController
  private

  def collection
    @orders ||= current_user.orders
  end

  def build_resource
    @order = collection.build(purchase_ids: current_user.purchases.cart.pluck(:id))
  end

  def resource
    @order ||= Order.find params[:id]
  end
end
