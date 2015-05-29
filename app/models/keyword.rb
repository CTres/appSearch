class Keyword < ActiveRecord::Base
  has_many :matches
  has_many :apps, -> { uniq }, through: :matches


  serialize :result, Array
end
