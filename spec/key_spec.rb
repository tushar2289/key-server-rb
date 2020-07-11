require_relative "../lib/classes/Key.rb"

describe Key do
  it "should create a key instance" do
    expect(subject).to be_an_instance_of(Key)
  end

  it "should have the class variables" do
    expect(subject.id).to be_truthy
    expect(subject.created_on).to be_truthy
    expect(subject.validity_started_on).to be_truthy
    expect(subject.refresh_count).to be_truthy
  end

  it "should be able to refresh its validity" do
    currentValidity = subject.validity_started_on
    subject.refresh
    expect(currentValidity).to be < subject.validity_started_on
    expect(subject.refresh_count).to eq(1)
  end
end