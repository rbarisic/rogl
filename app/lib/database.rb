module Engine
	class Database
		def initialize
		end

		def load
		end

		def save
		end
		
		def read
		end

		def write
		end

		def close
		end
	end

	class KeyValueDatabase < Database
		require 'gdbm'

		def initialize
		end

		def load
		end

		def save
		end
		
		def read
		end

		def write
		end

		def close
		end
	end

	class RelationalDatabase < Database
		require 'sqlite3'

		def initialize(database)
			# @db = SQLITE3::Database.new "#{database}.db"
		end

		def load

		end

		def save
		end

		def read
		end

		def write
		end

		def close
		end
	end
end

# use sequel as glue!