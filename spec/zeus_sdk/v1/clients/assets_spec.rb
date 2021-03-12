ASSETS_TEST_KEY = "sk_assets_qBevMItbItSy9DXe7uopyA"
Assets = ZeusSdk::V1::Assets

RSpec.describe ZeusSdk::V1::Assets do
    tests_project_environment_crud(Assets, ASSETS_TEST_KEY)
end