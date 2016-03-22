class Api::ProductsController < Api::BaseController
  private
  def collection
    @products ||= Product.all
  end

  def resource
    @product ||= Product.find params[:id]
  end
end

