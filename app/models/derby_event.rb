class DerbyEvent < ActiveRecord::Base
  validates :submission_contact, presence: true

  DATE_FORMAT = '%m/%d/%Y'

  def country_name
    cname = ISO3166::Country[country]
    cname.translations[I18n.locale.to_s] || cname.name
  end

  def display_date
    if start_date == end_date
      start_date.strftime(DATE_FORMAT)
    else
      "#{start_date.strftime(DATE_FORMAT)} - #{end_date.strftime(DATE_FORMAT)}"
    end
  end

  def rulesets
    ['mrda', 'wftda', 'jrda', 'made', 'usars', 'rdcl'].map do |ruleset|
      send(ruleset) ? ruleset.upcase : nil
    end.compact.join(', ')
  end

  def genders
    ['Male', 'Female', 'Co-Ed'].map do |gender|
      send(gender.downcase.gsub(/[^a-z]/, '')) ? gender : nil
    end.compact.join(', ')
  end
end
