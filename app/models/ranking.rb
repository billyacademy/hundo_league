class Ranking < ApplicationRecord
  belongs_to :team
  accepts_nested_attributes_for :team
  validates_uniqueness_of :team_id, :scope => :week_id
end
