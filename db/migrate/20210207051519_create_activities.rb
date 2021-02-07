class CreateActivities < ActiveRecord::Migration[6.1]
  def up
    execute <<-EOS
      CREATE TABLE activities (
          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
        , name VARCHAR(100) NOT NULL

        , created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
        , updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
      );
    EOS
  end

  def down
    execute <<-EOS
      DROP TABLE activities;
    EOS
  end
end
