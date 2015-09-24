class OpenPracticePresenter
  include CommonPresenter

  def initialize(open_practice)
    @open_practice = open_practice
  end

  def method_missing(method_name, *args)
    if open_practice.respond_to? method_name
      open_practice.send(method_name, *args)
    else
      super
    end
  end

  def display_days
    ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'].map do |day|
      if open_practice.send(day)
        start_time = open_practice.send("#{day}_start").strftime(TIME_FORMAT)
        end_time = open_practice.send("#{day}_end").strftime(TIME_FORMAT)
        "#{day.capitalize} #{start_time} - #{end_time}"
      end
    end.compact.join("<br>")
  end

  private

  attr_reader :open_practice
end

