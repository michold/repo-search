require 'spec_helper'

describe SearchRepositoriesController do
  let(:search_term)         { "awesome_repo" }
  let(:params)              { { search: search_term} }
  let(:search_service_stub) { double("search_service") }
  let(:items)               { %w(repo1 repo2) }

  context "#index" do
    before do
      allow(SearchRepos).to receive(:new).and_return(search_service_stub)
      allow(search_service_stub).to receive(:search).and_return(items)
    end

    it "returns a success response" do
      get :index, params: params
      response.should be_success
    end

    it "uses search service with proper arguments" do
      expect(SearchRepos).to receive(:new).with(search_term).and_return(search_service_stub)
      expect(search_service_stub).to receive(:search).and_return(items)

      get :index, params: params
    end

    context "no search term" do
      let(:params) { {} }

      it "returns a success response" do
        get :index, params: params
        response.should be_success
      end
    end

    context "empty string search term" do
      let(:search_term) { "" }

      it "returns a success response" do
        get :index, params: params
        response.should be_success
      end
    end
  end
end
