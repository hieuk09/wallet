module Reports
  class TransactionQuery
    def initialize(scope = Transaction.all)
      @scope = scope
    end

    def execute(params)
      if params.empty?
        scope
      else
        Transaction.where(paid_at: params.from..params.to)
      end.includes(:category)
    end

    private

    attr_reader :scope
  end
end
