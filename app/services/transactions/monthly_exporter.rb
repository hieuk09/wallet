require 'csv'

module Transactions
  class MonthlyExporter
    def initialize(scope)
      @scope = scope
    end

    def generate
      transactions = scope.map do |transaction|
        TransactionDecorator.new(transaction)
      end

      csv = CSV.generate do |data|
        data << ['Paid at', 'Category', 'Category type', 'Account', 'Amount', 'Description']
        transactions.each do |transaction|
          data << [
            transaction.paid_at,
            transaction.category_name,
            transaction.category_type,
            transaction.account_name,
            transaction.amount.exchange_to(:vnd),
            transaction.description
          ]
        end
      end
    end

    private

    attr_reader :scope
  end
end
