class PdfExtractor
  MONTH_REGEX = %w(
    Jan
    Feb
    Mar
    Apr
    May
    Jun
    Jul
    Aug
    Sep
    Oct
    Nov
    Dec
  ).join('|')
  PAID_AT_REGEX = /\d{1,2}(#{ MONTH_REGEX.upcase })/
  TRANSACTION_DATE_REGEX = /\d\d (#{ MONTH_REGEX })/
  START_TRANSACTION = /\A {7,8}#{ TRANSACTION_DATE_REGEX } /
  NUMERIC = ('0'..'9').to_a + %w(. ,)
  TRANSACTION_ROW_LENGTH = 4 # number of rows for a single transaction
  WITHDRAWAL_POSITION_OFFSET = 73
  DEPOSIT_POSITION_OFFSET = 96

  def extract(io)
    reader = PDF::Reader.new(io)
    total_string = reader.pages.map(&:text).join
    result = extract_transactions(total_string)

    result.map do |rows|
      main_row = rows.shift

      match = main_row.match(TRANSACTION_DATE_REGEX)
      start_position = match.offset(0).first

      withdrawal = extract_amount(main_row, start_position + WITHDRAWAL_POSITION_OFFSET)
      deposit = extract_amount(main_row, start_position + DEPOSIT_POSITION_OFFSET)

      next if deposit.nil? && withdrawal.nil?

      description = extract_description(rows)
      paid_at = extract_transaction_date(main_row, description)

      {
        paid_at: paid_at,
        withdrawal: withdrawal,
        deposit: deposit,
        description: description,
      }
    end.compact
  end

  private

  def extract_transactions(string)
    rows = string.split("\n")
    i = 0
    result = []

    while (i < rows.length)
      if rows[i].match?(START_TRANSACTION)
        result += [rows.slice(i, TRANSACTION_ROW_LENGTH)]

        i += TRANSACTION_ROW_LENGTH
      else
        i += 1
      end
    end

    result
  end

  def extract_amount(row, position)
    amount = nil

    while position.positive? do
      if NUMERIC.include?(row[position])
        amount = "#{row[position]}#{amount}"
        position -= 1
      else
        break
      end
    end

    if amount
      BigDecimal(amount.gsub(',', ''))
    end
  end

  def extract_description(rows)
    rows.map(&:strip).join(' ').strip.squeeze
  end

  def extract_transaction_date(main_row, description)
    match_data = description.match(PAID_AT_REGEX)

    if match_data
      year = DateTime.current.year
      full_date = "#{match_data.to_a.first}-#{year}"
      DateTime.strptime(full_date, "%d%b-%y")
    else
      main_row.match(TRANSACTION_DATE_REGEX).to_a.first.to_datetime
    end
  end
end
