class CreateClearedPayments < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE cleared_payments (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , payment_id BIGINT NOT NULL REFERENCES payments(id) UNIQUE
        , transaction_id BIGINT NOT NULL REFERENCES transactions(id) -- same can reference multiple payments

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      COMMENT ON COLUMN cleared_payments.transaction_id IS 'Can reference multiple payments'
    EOS
  end

  def down
    execute <<-EOS
      DROP TABLE cleared_payments;
    EOS
  end
end
