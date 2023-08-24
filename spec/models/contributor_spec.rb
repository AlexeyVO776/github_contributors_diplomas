require 'rails_helper'

RSpec.describe Contributor, type: :model do
  it "is valid with a login and contributions" do
    contributor = Contributor.new(login: 'JohnDoe', contributions: 5)
    expect(contributor).to be_valid
  end

end