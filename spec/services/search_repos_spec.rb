require 'spec_helper'

describe SearchRepos do
  let(:search_term) { "awesome_repo" }
  let(:client_stub) { double("client") }
  let(:repos_stub)  { double("repositories") }
  let(:items)       { %w(repo1 repo2) }
  let(:instance)    { described_class.new(search_term) }

  context "#search" do
    before do
      allow(Octokit::Client).to receive(:new).and_return(client_stub)
      allow(client_stub).to receive(:search_repositories).and_return(repos_stub)
      allow(repos_stub).to receive(:items).and_return(items)
    end

    it "initializes github client with proper arguments" do
      expect(Octokit::Client).to receive(:new).with(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN")).and_return(client_stub)

      instance.search
    end

    it "calls proper methods on API response" do
      expect(client_stub).to receive(:search_repositories).with(search_term).and_return(repos_stub)
      expect(repos_stub).to receive(:items).and_return(items)

      instance.search
    end

    it "returns proper result" do
      expect(instance.search).to eq(items)
    end

    context "nil search term" do
      let(:search_term) { nil }

      it "returns empty results array" do
        expect(instance.search).to eq([])
      end
    end

    context "empty string search term" do
      let(:search_term) { "" }

      it "returns empty results array" do
        expect(instance.search).to eq([])
      end
    end
  end
end
