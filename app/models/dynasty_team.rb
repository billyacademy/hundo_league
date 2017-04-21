class DynastyTeam < ApplicationRecord
  belongs_to :owner
  has_many :player_contracts
  has_many :draft_picks
  has_many :salary_cap_adjustments

  accepts_nested_attributes_for :player_contracts
  accepts_nested_attributes_for :draft_picks

end
