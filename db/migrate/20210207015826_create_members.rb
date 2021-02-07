class CreateMembers < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE members (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , family_id BIGINT NOT NULL REFERENCES families(id)
        , first_name VARCHAR(100)
        , last_name VARCHAR(100)
        , email VARCHAR(100) UNIQUE

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      CREATE UNIQUE INDEX members_full_name_uidx ON members(first_name, last_name);
      CREATE UNIQUE INDEX users_full_name_uidx ON users(first_name, last_name);

      CREATE UNIQUE INDEX users_email_uidx ON users(email);
    EOS
  end

  def down
    execute <<-EOS
      DROP INDEX users_email_uidx;
      DROP TABLE members;
    EOS
  end
end
