class App < ActiveRecord::Base
  #ASSOCS
  has_many :matches
  has_many :keywords, -> { uniq },  through: :matches


  #validations
  validates :app_id, presence: true

  self.primary_key = "app_id"

end
