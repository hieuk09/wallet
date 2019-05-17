class ExportParams
  def initialize(params, current = Date.current)
    @params = params
    @current = current
  end

  def from
    all? ? nil : date_by_month_year.beginning_of_month
  end

  def to
    all? ? nil : date_by_month_year.end_of_month
  end

  def account_id
    params[:account_id]
  end

  def all?
    year.zero? || month.zero?
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
