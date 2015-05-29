class Search

  def self.itunes(term)
    ITunesSearchAPI.search(:media => 'software', :term => term, :country => "US", :entity => 'software', :limit => 50)
  end

  def self.saveSearch(searchTerm, keyword)
    resultArray = []
    searchTerm.each do |result|
      resultArray.push(result['trackId'])
    end

    tempKeyword = Keyword.create(result: resultArray, value: keyword)

    # SAVE KEYWORD TO THE APP, WITH RANK
    searchTerm.each_with_index do |result, index|
      tempApp = App.find_or_create_by(app_id: result['trackId'])
      tempKeyword.matches.create(app: tempApp, term: keyword, rank: index + 1)
    end
  end
end
