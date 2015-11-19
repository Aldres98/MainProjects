require 'sqlite3'

db = SQLite3::Database.new 'test.sqlite'

db.execute "Insert into Cars (Name, Price) VALUES ('Jaguar', 77777)"




db.close