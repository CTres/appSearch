class Match < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :app
end
