CONTENT_TEST_KEY = "sk_content_qBevMItbItSy9DXe7uopyA"
Content = Zeus::V1::Client::Content

RSpec.describe Zeus::V1::Client::Content do
    tests_project_environment_crud(Content, CONTENT_TEST_KEY)
end