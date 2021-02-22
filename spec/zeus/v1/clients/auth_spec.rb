AUTH_TEST_KEY = "sk_auth_qBevMItbItSy9DXe7uopyA"
Auth = Zeus::V1::Client::Auth

RSpec.describe Zeus::V1::Client::Auth do
    tests_project_environment_crud(Auth, AUTH_TEST_KEY)
end