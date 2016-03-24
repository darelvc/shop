class Api::PurchasesController < Api::BaseController

  private
  def build_resource
    @purchase = Purchase.new resource_params
  end

  def resource
    @purchase ||= Purchase.find params[:id]
  end

  def collection
    @purchases ||= current_user.purchases
  end

  def resource_params
    params.require(:purchase).permit(:product_id, :quantity).merge(user_id: current_user.id)
  end
end
