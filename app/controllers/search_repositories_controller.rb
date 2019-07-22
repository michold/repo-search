class SearchRepositoriesController < ApplicationController
  def index
    render locals: { repos: repos }
  end

  private

  def repos
    return [] if search_term.blank?
    SearchRepos.new(search_term).search
  end

  def search_term
    params[:search]
  end
end
