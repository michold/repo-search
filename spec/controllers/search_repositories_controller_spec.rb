require 'spec_helper'

describe SearchRepositoriesController do
  let(:search_term) { "awesome_repo" }
  let(:params)      { { search: search_term} }

  context "#index" do
    it "should return a success response" do
      get :index, params: params
      response.should be_success
    end
  end
end
