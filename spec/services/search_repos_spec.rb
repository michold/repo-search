require 'spec_helper'

describe SearchRepos do
  let(:search_term) { "awesome_repo" }
  let(:instance)    { described_class.new(search_term) }

  context "#search" do
    it "initializes github client with proper arguments" do
      expect(Octokit::Client).to receive(:new).with(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"))

      instance.search
    end
  end
end
