require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  render_views
  let(:project) { FactoryGirl.create(:project) }

  describe "GET #show" do
    before(:each) do
      get :show, format: :json
    end

    describe "renders show json object" do
      it { should render_template(:show) }
      it { should respond_with(200) }
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      before(:each) do
        post :create, params: { id: 1 }
      end
      it { should respond_with(422) }
    end
  end
end
