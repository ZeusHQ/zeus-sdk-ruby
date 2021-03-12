RSpec.describe ZeusSdk::V1::Core do
    it "initializes" do
        client = ZeusSdk::V1::Core.new("test")
        expect(client).not_to be nil
    end
  
    it "can check domain existence" do
        client = ZeusSdk::V1::Core.new("")
        res = client.check_domain("abc123.zeusdev.io")
        
        expect(res).not_to be nil
        expect(res.parsed_response.class.name).to eq("Hash")
        expect(res.parsed_response).to have_key("exists")
        expect(res.parsed_response["exists"]).to eq(false)
    end
end
  