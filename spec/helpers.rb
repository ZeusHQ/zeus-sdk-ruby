TEST_SCOPE = 'all'
API_SCOPE = 'api'
WEB_SCOPE = 'api'

def test_client_initializes(client_class, key)
  client = client_class.new({zeus_auth_key: key})
  expect(client).not_to be nil
  expect(client.class.format).to eq(:json)
  expect(client.class.follow_redirects).to eq(true)
  expect(client.class.base_uri).to eq("http://localhost:#{client.class::LOCAL_PORT}")
  expect(client.zeus_auth_key).to eq(key)
end

def test_client_creates_project_env(client_class, key)
  client = client_class.new({zeus_auth_key: key})
  res = client.create_project_environment({scope: TEST_SCOPE})
  
  expect(res).not_to be nil
  expect(res.parsed_response.class.name).to eq("Hash")
  expect(res.parsed_response).to have_key("success")
  expect(res.parsed_response).to have_key("object")

  expect(res.parsed_response["success"]).to eq(true)
  expect(res.parsed_response["object"].class.name).to eq("Hash")
  expect(res.parsed_response["object"]).to have_key("id")
  expect(res.parsed_response["object"]).to have_key("scope")
  expect(res.parsed_response["object"]).to have_key("properties")
  expect(res.parsed_response["object"]).to have_key("public_key")
  expect(res.parsed_response["object"]).to have_key("secret_key")
  expect(res.parsed_response["object"]).to have_key("created_at")
  expect(res.parsed_response["object"]).to have_key("updated_at")
end

def test_client_gets_project_envs(client_class, key)
  client = client_class.new({zeus_auth_key: key})
  res1 = client.create_project_environment({scope: TEST_SCOPE})
  res2 = client.create_project_environment({scope: TEST_SCOPE})
  id1 = res1["object"]["id"]
  id2 = res2["object"]["id"]
  
  res = client.get_project_environments([id1, id2])

  expect(res).not_to be nil
  expect(res.parsed_response.class.name).to eq("Hash")
  expect(res.parsed_response).to have_key("success")
  expect(res.parsed_response).to have_key("objects")
  expect(res.parsed_response["objects"].class.name).to eq("Array")
  expect(res.parsed_response["objects"].length).to eq(2)
  expect(res.parsed_response["objects"][0].class.name).to eq("Hash")
  expect(res.parsed_response["objects"][0]).to have_key("id")
  expect(res.parsed_response["objects"][0]).to have_key("scope")
  expect(res.parsed_response["objects"][0]).to have_key("created_at")
  expect(res.parsed_response["objects"][0]).to have_key("updated_at")
end

def test_client_cant_create_project_envs_with_bad_key(client_class, key)
  client = client_class.new({public_key: "bad_key", secret_key: "bad_key2"})
  res = client.create_project_environment({scope: TEST_SCOPE})

  expect(res).not_to be nil
  expect(res.parsed_response.class.name).to eq("Hash")
  expect(res.parsed_response).to have_key("success")
  expect(res.parsed_response["success"]).to eq(false)
end

def tests_project_environment_crud(client_class, key)
  it "initializes with a valid zeus_auth_key" do
    test_client_initializes(client_class, key)
  end

  it "can create a project environment with a valid zeus_auth_key" do
    test_client_creates_project_env(client_class, key)
  end

  it "can get project_environments with a valid zeus_auth_key" do
    test_client_gets_project_envs(client_class, key)
  end

  it "can't create a project environment with an invalid zeus_auth_key" do
    test_client_cant_create_project_envs_with_bad_key(client_class, key)
  end
end