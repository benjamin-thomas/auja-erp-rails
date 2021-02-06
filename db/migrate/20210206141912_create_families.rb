class CreateFamilies < ActiveRecord::Migration[6.1]
 def up
   execute <<-EOS
     CREATE TABLE families (
         id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
       , name VARCHAR(255) UNIQUE
     );
   EOS
 end

 def down
   execute <<-EOS
     DROP TABLE families;
   EOS
 end
end
