class SearchesController< ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  after_filter :save_search, only: :search
  protect_from_forgery with: :exception

  def home
  end

  def search
    @keyword = params[:app][:keyword]
    @searchTerm = Search.itunes(@keyword)
  end

  private

  def save_search
    # SAVE THE KEYWORD OBJECT TO DB
    Search.saveSearch(@searchTerm, @keyword)
  end
end
