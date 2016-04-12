DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{File.expand_path('..', __FILE__)}/qq_test.db")
