class OpenPracticePresenter
  include CommonPresenter

  def initialize(open_practice)
    @open_practice = open_practice
  end

  def self.method_missing(method_name, *args)
    if OpenPractice.respond_to? method_name
      OpenPractice.send(method_name, *args)
    else
      super
    end
  end

  def method_missing(method_name, *args)
    if open_practice.respond_to? method_name
      open_practice.send(method_name, *args)
    else
      super
    end
  end

  def display_days
    open_practice.days.map do |day|
      start_time = open_practice.send("#{day}_start").try(:strftime, TIME_FORMAT)
      end_time = open_practice.send("#{day}_end").try(:strftime, TIME_FORMAT)
      "#{day.capitalize} #{start_time} - #{end_time}"
    end.join("<br>")
  end

  private

  attr_reader :open_practice
end

