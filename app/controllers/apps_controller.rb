class AppsController < ApplicationController

  before_filter :find_app


  def show
    @appFetch = App.lookup(@app)
    @keywords = App.lookupKeywords(@app)
  end

  #if it isn't in the database, add it.
  def find_app
    @app = App.find_or_create_by(app_id: params['app_id'])
  end

end
