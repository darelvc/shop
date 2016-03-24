class Api::ProductsController < Api::BaseController
  private
  def build_resource
    @product = Product.new resource_params
  end

  def collection
    @products ||= Product.all
  end

  def resource
    @product ||= Product.find params[:id]
  end

  def resource_params
    params.require(:product).permit(:name, :description, :price)
  end
end
