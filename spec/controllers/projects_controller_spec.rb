require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  render_views

  describe "POST #create" do
    context "with invalid params" do
      before(:each) do
        post :create, params: { id: 1 }
      end
      it { should respond_with(422) }
      it 'should not create the project' do
        expect(Project.exists?).to be false
      end
    end

    context "with valid params" do
      before(:each) do
        post :create, params: {
            id: 1,
            projectName: "test project number 1",
            creationDate: "05112017 00:00:00",
            expiryDate: "05202017 00:00:00",
            enabled: "True",
            targetCountries: ["USA", "CANADA", "MEXICO", "BRAZIL"],
            projectCost: 5.5,
            projectUrl: "http://www.unity3d.com",
            targetKeys: [{
                    number: 25,
                    keyword: "movie"
                },
                {
                    number: 30,
                    keyword: "sports"
                }]
        }
      end
      it { should respond_with(200) }
      it "should display success message" do
        expect(response.body).to match("campaign is successfully created")
      end
      it 'should create the project' do
        expect(Project.exists?).to be true
      end
    end
  end
end
