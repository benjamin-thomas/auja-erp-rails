class CreatePayments < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE payment_types (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , name VARCHAR(100)

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      CREATE TABLE payments (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , membership_id BIGINT NOT NULL REFERENCES memberships(id)
        , assigned_on TIMESTAMP WITHOUT TIME ZONE NOT NULL
        , payment_type_id BIGINT NOT NULL REFERENCES payment_types(id)
        , amount NUMERIC(19,2) NOT NULL
        , notes TEXT

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      CREATE INDEX payments_membership_id_idx ON payments(membership_id);
    EOS
  end

  def down
    execute <<-EOS
      DROP TABLE payments;
      DROP TABLE payment_types;
    EOS
  end
end
