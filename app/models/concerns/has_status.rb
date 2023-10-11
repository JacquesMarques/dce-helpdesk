module HasStatus
  extend ActiveSupport::Concern

  included do
    enum status: %w[active inactive].index_by(&:to_sym).freeze
  end
end
