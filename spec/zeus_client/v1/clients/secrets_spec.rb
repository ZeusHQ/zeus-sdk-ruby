SECRETS_TEST_KEY = "sk_secrets_qBevMItbItSy9DXe7uopyA"
Secrets = ZeusClient::V1::Secrets
BAD_KEY = "bad_key"

RSpec.describe ZeusClient::V1::Secrets do
    tests_project_environment_crud(Secrets, SECRETS_TEST_KEY)

    client_zeus_valid = Secrets.new({zeus_auth_key: SECRETS_TEST_KEY})
    client_zeus_invalid = Secrets.new({zeus_auth_key:BAD_KEY })
    env = client_zeus_valid.create_project_environment({ scope: WEB_SCOPE })
    client_zeus_valid.environment_id = env["object"]["id"]

    client_private_valid = ZeusClient::V1::Secrets.new({ public_key: env["object"]["public_key"], secret_key: env["object"]["secret_key"] })
    client_public_valid = ZeusClient::V1::Secrets.new({ public_key: env["object"]["public_key"] })

    client_private_invalid = ZeusClient::V1::Secrets.new({ public_key: BAD_KEY, secret_key: BAD_KEY })
    client_public_invalid = ZeusClient::V1::Secrets.new({ public_key: BAD_KEY })

    
    # VALID ZEUS CRUD
    it "can create a secret with a valid zeus key" do
        res = client_zeus_valid.set_secret("foo", "sekret")

        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response).to have_key("object")
        expect(res.parsed_response["object"].class.name).to eq("Hash")
        expect(res.parsed_response["object"]).to have_key("id")
        expect(res.parsed_response["object"]).to have_key("key")
        expect(res.parsed_response["object"]).to have_key("environment_id")
        expect(res.parsed_response["object"]).to have_key("created_at")
        expect(res.parsed_response["object"]).to have_key("updated_at")
        expect(res.parsed_response["object"]).to_not have_key("value")
        expect(res.parsed_response["object"]).to_not have_key("encrypted_value")
    end

    it "can list secrets with a valid zeus_auth_key" do
        res = client_zeus_valid.list_secrets({ })

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response).to have_key("objects")

        expect(res.parsed_response["objects"].class.name).to eq("Array")
        expect(res.parsed_response["objects"].length).to eq(1)
        expect(res.parsed_response["objects"][0].class.name).to eq("Hash")
        expect(res.parsed_response["objects"][0]).to have_key("id")
        expect(res.parsed_response["objects"][0]).to have_key("key")
        expect(res.parsed_response["objects"][0]).to have_key("environment_id")
        expect(res.parsed_response["objects"][0]).to have_key("created_at")
        expect(res.parsed_response["objects"][0]).to have_key("updated_at")
        expect(res.parsed_response["objects"][0]).to have_key("value")
    end

    it "can get a secret with a valid zeus key" do
        res = client_zeus_valid.get_secret("foo")
        
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response).to have_key("object")
        expect(res.parsed_response["object"].class.name).to eq("Hash")
        expect(res.parsed_response["object"]).to have_key("id")
        expect(res.parsed_response["object"]).to have_key("key")
        expect(res.parsed_response["object"]).to have_key("environment_id")
        expect(res.parsed_response["object"]).to have_key("created_at")
        expect(res.parsed_response["object"]).to have_key("updated_at")
        expect(res.parsed_response["object"]).to have_key("value")
    end

    # VALID PRIVATE CRUD
    it "can create a secret with a valid zeus key" do
        res = client_private_valid.set_secret("foo", "sekret")
        
        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response).to have_key("object")
        expect(res.parsed_response["object"].class.name).to eq("Hash")
        expect(res.parsed_response["object"]).to have_key("id")
        expect(res.parsed_response["object"]).to have_key("key")
        expect(res.parsed_response["object"]).to have_key("environment_id")
        expect(res.parsed_response["object"]).to have_key("created_at")
        expect(res.parsed_response["object"]).to have_key("updated_at")
        expect(res.parsed_response["object"]).to_not have_key("value")
        expect(res.parsed_response["object"]).to_not have_key("encrypted_value")
    end

    it "can list secrets with a valid secret_key/public_key" do
        res = client_private_valid.list_secrets({})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response).to have_key("objects")

        expect(res.parsed_response["objects"].class.name).to eq("Array")
        expect(res.parsed_response["objects"].length).to eq(1)
        expect(res.parsed_response["objects"][0].class.name).to eq("Hash")
        expect(res.parsed_response["objects"][0]).to have_key("id")
        expect(res.parsed_response["objects"][0]).to have_key("key")
        expect(res.parsed_response["objects"][0]).to have_key("environment_id")
        expect(res.parsed_response["objects"][0]).to have_key("created_at")
        expect(res.parsed_response["objects"][0]).to have_key("updated_at")
        expect(res.parsed_response["objects"][0]).to have_key("value")
        expect(res.parsed_response["objects"][0]).to_not have_key("encrypted_value")
    end

    # VALID PUBLIC CRUD
    it "can't create a secret with a valid public key" do
        res = client_public_valid.set_secret("foo", "sekret")
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    it "can't list secrets with a valid public key" do
        res = client_public_valid.list_secrets({})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    # INVALID ZEUS CRUD
    it "can't create a secret with an invalid zeus key" do
        res = client_zeus_invalid.set_secret( "foo", "sekret")
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    it "can't list secrets with an invalid zeus key" do
        res = client_zeus_invalid.list_secrets({})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    # INVALID PRIVATE CRUD
    it "can't create a secret with an invalid private key" do
        res = client_private_invalid.set_secret("foo", "sekret")
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    it "can't list secrets with an invalid private key" do
        res = client_private_invalid.list_secrets({})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    # INVALID PUBLIC CRUD
    it "can't create a secret with an invalid private key" do
        res = client_public_invalid.set_secret("foo", "sekret")
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end

    it "can't list secrets with an invalid private key" do
        res = client_public_invalid.list_secrets({})

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("success")
        expect(res.parsed_response["success"]).to eq(false)
    end


end