CONTENT_TEST_KEY = "sk_content_qBevMItbItSy9DXe7uopyA"
Content = ZeusClient::V1::Content

RSpec.describe ZeusClient::V1::Content do
    tests_project_environment_crud(Content, CONTENT_TEST_KEY)
end