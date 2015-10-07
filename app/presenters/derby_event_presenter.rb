class DerbyEventPresenter
  include CommonPresenter

  def initialize(derby_event)
    @derby_event = derby_event
  end

  def self.method_missing(method_name, *args)
    if DerbyEvent.respond_to? method_name
      DerbyEvent.send(method_name, *args)
    else
      super
    end
  end

  def method_missing(method_name, *args)
    if derby_event.respond_to? method_name
      derby_event.send(method_name, *args)
    else
      super
    end
  end

  def display_date
    if derby_event.start_date == derby_event.end_date || derby_event.end_date.nil?
      derby_event.start_date.strftime(DATE_FORMAT)
    else
      "#{derby_event.start_date.strftime(DATE_FORMAT)} - #{derby_event.end_date.strftime(DATE_FORMAT)}"
    end
  end

  def display_datetime
    display_str = derby_event.start_date.strftime(DATE_FORMAT)
    if derby_event.start_time
      display_str << " #{derby_event.start_time.strftime(TIME_FORMAT)}"
    end
    if derby_event.end_date != derby_event.start_date && !derby_event.end_date.nil?
      display_str << " - #{derby_event.end_date.strftime(DATE_FORMAT)}"
    end
    if derby_event.end_time
      if derby_event.end_date != derby_event.start_date
        display_str << " #{derby_event.end_time.strftime(TIME_FORMAT)}"
      else
        display_str << " - #{derby_event.end_time.strftime(TIME_FORMAT)}"
      end
    end
    display_str
  end

  def rulesets
    derby_event.rulesets.map {|ruleset| ruleset.upcase}.join(', ')
  end

  def genders
    derby_event.genders.join(', ')
  end

  def html_info
    derby_event.general_info.gsub(/\r?\n/, "<br>") if derby_event.general_info
  end

  private
 
  attr_reader :derby_event
end
