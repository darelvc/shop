require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/orders').to(action: :index) }

  it { should route(:post, '/api/orders').to(action: :create) }

  it { should route(:delete, '/api/orders/1').to(action: :destroy, id: 1) }

  it { should route(:get, '/api/orders/1').to(action: :show, id: 1) }

  let(:order) { stub_model Order }

  before { sign_in }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@order, order }

    before { get :show, id: 55, format: :json }

    it { should render_template :show }
  end

   describe '#destroy.json' do
    before { expect(Order).to receive(:find).with('8').and_return(order) }

    before { expect(order).to receive(:destroy!) }

    before { delete :destroy, id: 8, format: :json }

    it { should respond_with :ok }
  end

  describe '#collection' do
    let(:orders) { double }

    before { expect(subject.current_user).to receive(:orders).and_return(orders) }

    its(:collection) { should eq orders }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@order, :order }

    its(:resource) { should eq :order }
  end
end
