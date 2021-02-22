ASSETS_TEST_KEY = "sk_assets_qBevMItbItSy9DXe7uopyA"
Assets = Zeus::V1::Client::Assets

RSpec.describe Zeus::V1::Client::Assets do
    tests_project_environment_crud(Assets, ASSETS_TEST_KEY)
end