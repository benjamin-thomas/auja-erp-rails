class CreateMemberships < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE seasons (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , activity_id BIGINT NOT NULL REFERENCES activities(id)
        , starts_on TIMESTAMP WITHOUT TIME ZONE NOT NULL

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      CREATE TABLE memberships (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , family_id BIGINT NOT NULL REFERENCES families(id)
        , season_id BIGINT NOT NULL REFERENCES seasons(id)

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );

      CREATE UNIQUE INDEX memberships_uniq_registration_uidx ON memberships(family_id, season_id);
    EOS
  end

  def down
    execute <<-EOS
      DROP TABLE memberships;
      DROP TABLE seasons;
    EOS
  end
end
