class ExportParams
  def initialize(params, current = Date.current)
    @params = params
    @current = current
  end

  def from
    date_by_month_year.beginning_of_month
  end

  def to
    date_by_month_year.end_of_month
  end

  def file_name
    "#{month}-#{year}.csv"
  end

  def all?
    params['all'].present?
  end

  private

  attr_reader :params, :current

  def month
    @month ||= params.fetch('date(2i)', current.month).to_i
  end

  def year
    @year ||= params.fetch('date(1i)', current.year).to_i
  end

  def date_by_month_year
    @date_by_month_year ||= DateTime.new(year, month)
  end
end
