class SearchRepositoriesController < ApplicationController
  def index
    render locals: { repos: repos }
  end

  private

  def repos
    SearchRepos.new(search_term).search
  end

  def search_term
    params[:search]
  end
end
