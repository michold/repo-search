class SearchRepositoriesController < ApplicationController
  def index
    render locals: locals
  end

  private

  def locals
    {
      repos:       repos,
      search_term: search_term
    }
  end

  def repos
    return [] if search_term.blank?
    SearchRepos.new(search_term).search
  end

  def search_term
    @search_term ||= params[:search]
  end
end
