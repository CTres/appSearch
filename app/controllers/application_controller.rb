class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  after_filter :save_search, only: :search
  protect_from_forgery with: :exception

  def home
    @searchTerm = []
  end

  def search
    @keyword = params[:app][:keyword]

    @searchTerm = ITunesSearchAPI.search(:media => 'software', :term => @keyword, :country => "US", :entity => 'software', :limit => 50)
  end

  def save_app_to_db
    @searchTerm.each do |app|
      puts  app['trackId']
      App.find_or_create_by(app_id: app['trackId'])
    end
  end

  def save_search
    # SAVE THE KEYWORD OBJECT TO DB
    resultArray = []
    @searchTerm.each do |result|
      resultArray.push(result['trackId'])
    end

    tempKeyword = Keyword.create(result: resultArray, value: @keyword)

    # SAVE KEYWORD TO THE APP, WITH RANK
    @searchTerm.each_with_index do |result, index|
      tempApp = App.find_or_create_by(app_id: result['trackId'])
      tempKeyword.matches.create(app: tempApp, term: @keyword, rank: index + 1)
    end
  end
end
