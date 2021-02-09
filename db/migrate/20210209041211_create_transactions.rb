class CreateTransactions < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE transactions (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , cleared_on TIMESTAMP WITHOUT TIME ZONE NOT NULL
        , amount NUMERIC(19,2) NOT NULL
        , descr TEXT NOT NULL

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );
    EOS
  end

  def down
    execute <<-EOS
      DROP TABLE transactions;
    EOS
  end
end
