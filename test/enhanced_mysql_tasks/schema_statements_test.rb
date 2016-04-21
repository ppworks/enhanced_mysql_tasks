require 'test_helper'

class EnhancedMySQLTasks::SchemaStatementsTest < Minitest::Test
  def setup
    ActiveRecord::Base.establish_connection(adapter: 'fake')
  end

  def test_structure_dump
    @schema_migrations = %w{ 20160101010101 20160201010102 20160301010103 }.inject([]) do |migrations, v|
      migrations << stub('ActiveRecord::SchemaMigration', version: v)
    end
    ActiveRecord::SchemaMigration.expects(:order).with('version').returns(@schema_migrations)
    ActiveRecord::Migrator.expects(:schema_migrations_table_name).returns('schema_migrations')
    assert_equal "INSERT INTO schema_migrations (version) VALUES
('20160101010101'),
('20160201010102'),
('20160301010103');", ActiveRecord::Base.connection.dump_schema_information
  end
end
