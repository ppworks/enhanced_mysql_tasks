require 'test_helper'

class EnhancedMysqlTasksTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnhancedMysqlTasks::VERSION
  end
end
