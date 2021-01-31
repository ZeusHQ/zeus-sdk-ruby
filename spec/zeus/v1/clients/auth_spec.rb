RSpec.describe Zeus::Sdk::V1::Clients::Auth do
    AUTH_TEST_KEY = "sk_auth_qBevMItbItSy9DXe7uopyA"
    AUTH_TEST_UUID = SecureRandom::uuid
    AUTH_TEST_SCOPE = "all"

    it "initializes with a zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Auth.new({zeus_auth_key: AUTH_TEST_KEY})
        
        expect(client).not_to be nil
        expect(client.class.format).to eq(:json)
        expect(client.class.follow_redirects).to eq(true)
        expect(client.class.base_uri).to eq("http://localhost:3003")
        expect(client.zeus_auth_key).to eq(AUTH_TEST_KEY)
    end

    it "can create a project environment with a valid zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Auth.new({zeus_auth_key: AUTH_TEST_KEY})
        res = client.create_project_environment({project_id: AUTH_TEST_UUID, scope: AUTH_TEST_SCOPE})
        
        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("id")
        expect(res.parsed_response).to have_key("project_id")
        expect(res.parsed_response).to have_key("scope")
        expect(res.parsed_response).to have_key("public_key")
        expect(res.parsed_response).to have_key("secret_key")
        expect(res.parsed_response).to have_key("created_at")
        expect(res.parsed_response).to have_key("updated_at")
    end

    it "can get project_environments with a valid zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Auth.new({zeus_auth_key: AUTH_TEST_KEY})
        res = client.get_project_environments(AUTH_TEST_UUID)

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Array")
        expect(res.parsed_response[0].class.name).to eq("Hash")
        expect(res.parsed_response[0]).to have_key("id")
        expect(res.parsed_response[0]).to have_key("project_id")
        expect(res.parsed_response[0]).to have_key("scope")
        expect(res.parsed_response[0]).to have_key("created_at")
        expect(res.parsed_response[0]).to have_key("updated_at")
    end

    it "can't create a project environment with an invalid zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Auth.new({public_key: "bad_key", secret_key: "bad_key2"})
        res = client.create_project_environment({project_id: AUTH_TEST_UUID, scope: AUTH_TEST_SCOPE})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success?")
        expect(res.parsed_response["success?"]).to eq(false)
    end
end