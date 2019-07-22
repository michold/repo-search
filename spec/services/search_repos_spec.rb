require 'spec_helper'

describe SearchRepos do
  let(:search_term) { "awesome_repo" }
  let(:instance)    { described_class.new(search_term) }

  context "#search" do
    it "works" do
      instance
    end
  end
end
