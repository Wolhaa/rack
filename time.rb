class TimeParser
  FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(time_params)
    @time_params = time_params['format']&.split(',')
  end

  def success?
    wrong_formats.empty? && @time_params.any?
  end

  def result
    if success?
      [Time.now.strftime(formats_values)]
    else
      ["Unknown time format [#{wrong_formats.join(', ')}]"]
    end
  end

  private

  def formats_values
    FORMATS.values_at(*@time_params).join('-')
  end

  def wrong_formats
    @time_params - FORMATS.keys
  end  
end
