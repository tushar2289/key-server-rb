require_relative "../lib/classes/KeyBase.rb"
require_relative "../lib/classes/Key.rb"

describe KeyBase do
  it "should create a keybase instance" do
    expect(subject).to be_an_instance_of(KeyBase)
  end

  it "should have the class variables" do
    expect(subject.unblocked_keys).to be_truthy
    expect(subject.blocked_keys).to be_truthy
  end

  it "should be able to generate key" do
    keysLength = subject.unblocked_keys.keys.length
    key = subject.generateKey
    expect(key).to be_an_instance_of(Key)
    expect(subject.unblocked_keys.keys.length).to eq(keysLength+1)
  end

  it "should be able to provide an available key" do
    key = subject.generateKey
    newKey = subject.getAvailableKey
    expect(subject.unblocked_keys[newKey.id]).to be_nil
    expect(subject.blocked_keys[newKey.id]).to_not be_nil
    expect(newKey).to eq(key)
  end

  it "should return 'Key not available' if no keys are free" do
    newKey = subject.getAvailableKey
    expect(newKey).to eq("Key not available")
  end

  it "should be able to unblock key" do
    subject.generateKey
    key = subject.getAvailableKey

    response = subject.unblockKey(key.id)
    expect(response).to eq("Key unblocked")
    expect(subject.unblocked_keys[key.id]).to_not be_nil
    expect(subject.blocked_keys[key.id]).to be_nil
  end

  it "should return 'Key not available' if key requested to be unblocked is not blocked already" do
    response = subject.unblockKey("tushar")
    expect(response).to eq("Key not available")
  end

  it "should be able to delete key" do
    key = subject.generateKey
    response = subject.deleteKey(key.id)
    expect(response).to eq("Key deleted")
    expect(subject.unblocked_keys[key.id]).to be_nil
  end

  it "should return 'Key not available' if key requested to be deleted isn't present" do
    response = subject.deleteKey("tushar")
    expect(response).to eq("Key not available")
  end

  it "should be able to keep alive key" do
    key = subject.generateKey
    response = subject.keepAlive(key.id)
    expect(response).to eq("Key refreshed")
  end

  it "should return 'Key not available' if key requested to be kept alive isn't present" do
    response = subject.keepAlive("tushar")
    expect(response).to eq("Key not available")
  end
end