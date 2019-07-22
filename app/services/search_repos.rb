class SearchRepos
  def initialize(search_term)
    @search_term = search_term
  end

  def search
    client
  end

  private

  attr_reader :search_term

  def client
    @client ||= Octokit::Client.new(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"))
  end
end
