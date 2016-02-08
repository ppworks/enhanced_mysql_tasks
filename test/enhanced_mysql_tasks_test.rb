require 'test_helper'

class EnhancedMySQLTasksTest < Minitest::Test

  def setup
    @configuration = {
      'adapter'  => 'mysql',
      'database' => 'test-db'
    }
  end

  def test_structure_dump
    filename = 'structure.sql'

    File.expects(:read).with(filename).returns(String.new(''))
    File.expects(:write).returns(nil)

    Kernel.expects(:system).with('mysqldump', '--result-file', filename, '--no-data','--routines', '--skip-comments', '--skip-dump-date', 'test-db').returns(true)
    ActiveRecord::Tasks::DatabaseTasks.structure_dump(@configuration, filename)
  end
end
