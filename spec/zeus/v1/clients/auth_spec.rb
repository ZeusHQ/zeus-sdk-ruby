AUTH_TEST_KEY = "sk_auth_qBevMItbItSy9DXe7uopyA"
Auth = ZeusClient::V1::Auth

RSpec.describe ZeusClient::V1::Auth do
    tests_project_environment_crud(Auth, AUTH_TEST_KEY)
end