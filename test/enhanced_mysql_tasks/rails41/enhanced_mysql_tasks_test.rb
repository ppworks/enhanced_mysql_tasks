require 'test_helper'

if Gem::Version.create('4.1.0') <= Gem::Version.create(ActiveRecord.version) \
  && Gem::Version.create(ActiveRecord.version) < Gem::Version.create('4.2.0')
  class EnhancedMySQLTasks::Rails41::MySQLDatabaseTasksTest < Minitest::Test

    def setup
      @configuration = {
        'adapter'  => 'mysql',
        'database' => 'test-db'
      }
    end

    def test_structure_dump
      filename = 'structure.sql'

      File.expects(:read).with(filename).returns(String.new(''))

      Kernel.expects(:system).with('mysqldump', '--result-file', filename, '--no-data','--routines', '--skip-comments', '--skip-dump-date', 'test-db').returns(true)
      ActiveRecord::Tasks::DatabaseTasks.structure_dump(@configuration, filename)
    end
  end
end
