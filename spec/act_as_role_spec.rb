RSpec.describe ActAsRole do
  it "has a version number" do
    expect(ActAsRole::VERSION).not_to be nil
  end

  it "does something useful" do
    Post.create!
    pp Post.all
    expect(false).to eq(true)
  end
end
