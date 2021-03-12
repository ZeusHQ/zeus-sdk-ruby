MULTIPLAYER_TEST_KEY = "sk_multiplayer_qBevMItbItSy9DXe7uopyA"
Multiplayer = ZeusClient::V1::Multiplayer

RSpec.describe ZeusClient::V1::Multiplayer do
    tests_project_environment_crud(Multiplayer, MULTIPLAYER_TEST_KEY)
end