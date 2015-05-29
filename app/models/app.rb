class App < ActiveRecord::Base
  #ASSOCS
  has_many :matches
  has_many :keywords, -> { uniq },  through: :matches


  #VALIDATIONS
  validates :app_id, presence: true

  #SET PRIMARY KEY
  self.primary_key = "app_id"

  #METHODS
  def self.lookup(app)
    # GET APP DETAILS FROM ITUNES
    appFetch = ITunesSearchAPI.lookup(id: app.app_id)
  end

  def self.lookupKeywords(app)
    # GET APP KEYWORDS
    keywords = []
    app.keywords.each do |k|
      hash = {:term => k.value, :rank => k.result.index(app.app_id.to_i) + 1 }
      keywords.push(hash)
    end
    return keywords
  end
end
