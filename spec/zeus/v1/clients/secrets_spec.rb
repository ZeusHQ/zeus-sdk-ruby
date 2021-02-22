RSpec.describe Zeus::V1::Client::Secrets do
    SECRETS_TEST_KEY = "sk_secrets_qBevMItbItSy9DXe7uopyA"
    SECRETS_TEST_UUID = SecureRandom::uuid
    SECRETS_TEST_SCOPE = "web"

    # it "initializes with a zeus_auth_key" do
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
    #     expect(client).not_to be nil
    #     expect(client.class.format).to eq(:json)
    #     expect(client.class.follow_redirects).to eq(true)
    #     expect(client.class.base_uri).to eq("http://localhost:3002")
    #     expect(client.zeus_auth_key).to eq(SECRETS_TEST_KEY)
    # end

    # it "can create a project environment with a valid zeus_auth_key" do
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
    #     res = client.create_project_environment({project_id: SECRETS_TEST_UUID, scope: SECRETS_TEST_SCOPE})
        
    #     expect(res).not_to be nil
    #     expect(res.parsed_response.class.name).to eq("Hash")
    #     expect(res.parsed_response).to have_key("id")
    #     expect(res.parsed_response).to have_key("project_id")
    #     expect(res.parsed_response).to have_key("scope")
    #     expect(res.parsed_response).to have_key("public_key")
    #     expect(res.parsed_response).to have_key("secret_key")
    #     expect(res.parsed_response).to have_key("created_at")
    #     expect(res.parsed_response).to have_key("updated_at")
    # end

    # it "can get project_environments with a valid zeus_auth_key" do
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
    #     res = client.get_project_environments(SECRETS_TEST_UUID)

    #     expect(res).not_to be nil
    #     expect(res.parsed_response.class.name).to eq("Array")
    #     expect(res.parsed_response[0].class.name).to eq("Hash")
    #     expect(res.parsed_response[0]).to have_key("id")
    #     expect(res.parsed_response[0]).to have_key("project_id")
    #     expect(res.parsed_response[0]).to have_key("scope")
    #     expect(res.parsed_response[0]).to have_key("created_at")
    #     expect(res.parsed_response[0]).to have_key("updated_at")
    # end

    # it "can't create a project environment with an invalid zeus_auth_key" do
    #     client = Zeus::V1::Client::Secrets.new({public_key: "bad_key", secret_key: "bad_key2"})
    #     res = client.create_project_environment({project_id: SECRETS_TEST_UUID, scope: SECRETS_TEST_SCOPE})

    #     expect(res).not_to be nil
    #     expect(res.parsed_response.class.name).to eq("Hash")
    #     expect(res.parsed_response).to have_key("success?")
    #     expect(res.parsed_response["success?"]).to eq(false)
    # end

    it "can list secrets with a valid zeus_auth_key" do
        scope = "test_scope_create"
        client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
        env = client.create_project_environment({project_id: SECRETS_TEST_UUID, scope: scope})
        res = client.list_secrets({project_id: SECRETS_TEST_UUID, scope: scope})

        expect(res).not_to be nil        
        expect(res.parsed_response.class.name).to eq("Array")
        expect(res.parsed_response.length).to eq(0)

        res2 = client.list_secrets({environment_id: env["id"]})
        expect(res2).not_to be nil
        expect(res2.parsed_response.class.name).to eq("Array")
        expect(res2.parsed_response.length).to eq(0)
    end

    # it "can list secrets with a valid secret_key/public_key" do
    #     scope = "test_scope#{(rand * 100000).round}"
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
    #     env = client.create_project_environment({project_id: SECRETS_TEST_UUID, scope: scope})

    #     client2 = Zeus::V1::Client::Secrets.new({
    #         public_key: env["public_key"], 
    #         secret_key: env["secret_key"], 
    #         project_id: SECRETS_TEST_UUID, 
    #         scope: scope
    #     })
    #     res2 = client.list_secrets({})

    #     expect(res2).not_to be nil
    #     expect(res2.parsed_response.class.name).to eq("Array")
    # end

    # it "can create a secret with a valid zeus key" do
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY, project_id: SECRETS_TEST_UUID, scope: SECRETS_TEST_SCOPE})
    #     res = client.create_secret({key: "foo", value: "sekret"})
    # end

    # it "can get a secret with a valid zeus key" do
    #     client = Zeus::V1::Client::Secrets.new({zeus_auth_key: SECRETS_TEST_KEY, project_id: SECRETS_TEST_UUID, scope: SECRETS_TEST_SCOPE})
    #     res = client.get_secret({key: "foo"})

    #     expect(res).not_to be nil
    #     expect(res.parsed_response.class.name).to eq("Hash")
    #     expect(res.parsed_response).to have_key("id")
    #     expect(res.parsed_response).to have_key("key")
    #     expect(res.parsed_response).to have_key("zeus_service_engine_project_environment_id")
    #     expect(res.parsed_response).to have_key("created_at")
    #     expect(res.parsed_response).to have_key("updated_at")

    #     expect(res.parsed_response).to_not have_key("value")
    #     expect(res.parsed_response).to_not have_key("encrypted_value")
    # end
end