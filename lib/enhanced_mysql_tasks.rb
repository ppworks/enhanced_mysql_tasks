require 'enhanced_mysql_tasks/version'

module EnhancedMySQLTasks
end

if Gem::Version.create(ActiveRecord.version) >= Gem::Version.create('4.2.0')
  require 'enhanced_mysql_tasks/rails42/mysql_database_tasks'
  ActiveRecord::Tasks::MySQLDatabaseTasks.__send__(:prepend, EnhancedMySQLTasks::Rails42::MySQLDatabaseTasks)
elsif Gem::Version.create(ActiveRecord.version) >= Gem::Version.create('4.1.0')
  require 'enhanced_mysql_tasks/rails41/mysql_database_tasks'
  ActiveRecord::Tasks::MySQLDatabaseTasks.__send__(:prepend, EnhancedMySQLTasks::Rails41::MySQLDatabaseTasks)
end
