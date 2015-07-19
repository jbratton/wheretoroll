class DerbyEvent < ActiveRecord::Base
  validates :submission_contact, presence: true

  def rulesets
    ['mrda', 'wftda', 'jrda', 'made', 'usars', 'rdcl'].map do |ruleset|
      send(ruleset) ? ruleset.upcase : nil
    end.join(', ')
  end

  def genders
    ['Male', 'Female', 'COED'].map do |gender|
      send(gender.downcase) ? gender : nil
    end.join(', ')
  end
end
