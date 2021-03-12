AUTH_TEST_KEY = "sk_auth_qBevMItbItSy9DXe7uopyA"
Auth = ZeusSdk::V1::Auth

RSpec.describe ZeusSdk::V1::Auth do
    tests_project_environment_crud(Auth, AUTH_TEST_KEY)
end