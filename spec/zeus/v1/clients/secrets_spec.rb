RSpec.describe Zeus::Sdk::V1::Clients::Secrets do
    TEST_KEY = "sk_secrets_qBevMItbItSy9DXe7uopyA"

    it "initializes with a zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Secrets.new({zeus_auth_key: TEST_KEY})
        expect(client).not_to be nil
        expect(client.class.headers).to have_key("X-ZEUS-AUTH-KEY")
    end
  
    it "can get project_environments with a valid zeus_auth_key" do
        client = Zeus::Sdk::V1::Clients::Secrets.new({zeus_auth_key: TEST_KEY})
        res = client.get_project_environments("abc")

        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Array")
    end
end