# frozen_string_literal: true

class PdfExtractor
  MONTH_REGEX = %w[
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
  ].join('|')
  PAID_AT_REGEX = /\d{2}(#{MONTH_REGEX.upcase})/.freeze
  TRANSACTION_DATE_REGEX = /\d\d (#{MONTH_REGEX})/.freeze
  START_TRANSACTION = /\A {7,8}#{TRANSACTION_DATE_REGEX} /.freeze
  SHORT_DESCRIPTION = [
    'ATM Cash Withdrawal',
    'Advice Funds Transfer',
    'Advice Bill Payment'
  ]
  NUMERIC = ('0'..'9').to_a + ['.', ',', ' ']
  TRANSACTION_ROW_LENGTH = 4 # number of rows for a single transaction
  WITHDRAWAL_POSITION = [70, 20].freeze
  DEPOSIT_POSITION = [95, 20].freeze

  def extract(io)
    reader = PDF::Reader.new(io)
    total_string = reader.pages.map(&:text).join
    result = extract_transactions(total_string)

    result.map do |rows|
      main_row = rows.shift

      withdrawal = extract_amount(main_row, WITHDRAWAL_POSITION)
      deposit = extract_amount(main_row, DEPOSIT_POSITION)

      next if deposit.nil? && withdrawal.nil?

      description = extract_description(rows)
      paid_at = extract_transaction_date(main_row, description)

      {
        paid_at: paid_at,
        withdrawal: withdrawal,
        deposit: deposit,
        description: description
      }
    end.compact
  end

  private

  def extract_transactions(string)
    rows = string.split("\n")
    i = 0
    result = []

    while i < rows.length
      if rows[i].match?(START_TRANSACTION)
        row_length = short_description?(rows[i]) ? TRANSACTION_ROW_LENGTH - 1 : TRANSACTION_ROW_LENGTH
        result += [rows.slice(i, row_length)]
        i += row_length
      else
        i += 1
      end
    end

    result
  end

  def extract_amount(row, position)
    amount = row.slice(*position)
    return if amount.blank?

    BigDecimal(amount.strip.gsub(',', ''))
  end

  def extract_description(rows)
    rows.map(&:strip).join(' ').strip.squeeze
  end

  def extract_transaction_date(main_row, description)
    match_data = description.match(PAID_AT_REGEX)

    if match_data
      year = DateTime.current.year
      full_date = "#{match_data.to_a.first}-#{year}"
      DateTime.strptime(full_date, '%d%b-%y')
    else
      main_row.match(TRANSACTION_DATE_REGEX).to_a.first.to_datetime
    end
  end

  def short_description?(row)
    SHORT_DESCRIPTION.any? { |text| row.include?(text) }
  end
end
