# typed: true

module Reports
  class TransactionQuery
    def initialize(scope = Transaction.all)
      @scope = scope
    end

    def execute(params)
      data = scope

      unless params.all_time?
        data = data.where(paid_at: params.from..params.to)
      end

      if params.account_id.present?
        data = data.where(account_id: params.account_id)
      end

      data.includes(:category)
    end

    private

    attr_reader :scope
  end
end
