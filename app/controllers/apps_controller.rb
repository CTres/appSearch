class AppsController < ApplicationController

  before_filter :find_app


  def show
    @appFetch = ITunesSearchAPI.lookup(id: @app.app_id)
    @keywords = []
    @app.keywords.each do |k|
      hash = {:term => k.value, :rank => k.result.index(@app.app_id.to_i) + 1 }
      @keywords.push(hash)
    end
  end

  #if it isn't in the database, add it.
  def find_app
    @app = App.find_or_create_by(app_id: params['app_id'])
  end

end
