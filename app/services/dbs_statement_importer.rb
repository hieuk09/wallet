class DbsStatementImporter
  def initialize(pdf_extractor: PdfExtractor.new)
    @pdf_extractor = pdf_extractor
  end

  def import(file, account_id)
    income_category = Category.income.first
    expense_category = Category.expense.first
    transactions = pdf_extractor.extract(StringIO.new(file.read))

    import = Import.create(name: file.original_filename, account_id: account_id)

    transactions = transactions.map do |transaction|
      withdrawal = transaction.delete(:withdrawal)
      deposit = transaction.delete(:deposit)
      amount = nil
      category_id = nil

      if withdrawal
        amount = withdrawal
        category_id = expense_category.id
      elsif deposit
        amount = deposit
        category_id = income_category.id
      else
        raise 'Invalid transaction'
      end

      transaction.merge(
        account_id: account_id,
        category_id: category_id,
        amount_cents: amount * 100,
        amount_currency: 'SGD',
        import_id: import.id
      )
    end

    ImportTransaction.import(transactions, validate: false)
  end

  private

  attr_reader :pdf_extractor
end
