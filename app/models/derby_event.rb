class DerbyEvent < ActiveRecord::Base
  GENDERS = %w(Male Female Co-Ed)
  RULESETS = %w(mrda wftda jrda made usars rdcl)

  scope :viewable, -> { where(approved: true, deleted: false) }
  scope :upcoming, -> { where("start_date >= ? OR end_date >= ?", Date.today, Date.today) }

  def viewable?
    approved && !deleted
  end

  def rulesets
    RULESETS.select {|ruleset| send(ruleset)}
  end

  def genders
    GENDERS.select do |gender|
      send(gender.downcase.gsub(/[^a-z]/, ''))
    end
  end
end

