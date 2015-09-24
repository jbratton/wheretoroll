class DerbyEvent < ActiveRecord::Base
  GENDERS = %w(Male Female Co-Ed)
  RULESETS = %w(mrda wftda jrda made usars rdcl)

  def rulesets
    RULESETS.select {|ruleset| send(ruleset)}
  end

  def genders
    GENDERS.select do |gender|
      send(gender.downcase.gsub(/[^a-z]/, ''))
    end
  end
end

