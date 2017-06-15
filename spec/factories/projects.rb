FactoryGirl.define do
  factory :project do
    id 1
    project_name "test_project_1"
    creation_date DateTime.now
    expiry_date DateTime.now + 1
    enabled "True"
    project_cost 5.5
    project_url "http://www.unity3d.com"
  end
end
