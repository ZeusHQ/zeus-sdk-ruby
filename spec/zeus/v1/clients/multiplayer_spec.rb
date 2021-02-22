MULTIPLAYER_TEST_KEY = "sk_multiplayer_qBevMItbItSy9DXe7uopyA"
Multiplayer = Zeus::V1::Client::Multiplayer

RSpec.describe Zeus::V1::Client::Multiplayer do
    tests_project_environment_crud(Multiplayer, MULTIPLAYER_TEST_KEY)
end