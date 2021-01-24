RSpec.describe Zeus::Sdk::V1::Clients::Core do
    it "initializes" do
        client = Zeus::Sdk::V1::Clients::Core.new("test")
        expect(client).not_to be nil
    end
  
    it "can check domain existence" do
        client = Zeus::Sdk::V1::Clients::Core.new("")
        res = client.check_domain("abc123.zeusdev.co")
        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("exists")
        expect(res.parsed_response["exists"]).to eq(false)
    end
end
  