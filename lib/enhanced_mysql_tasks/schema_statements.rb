module EnhancedMySQLTasks
  module SchemaStatements
    def dump_schema_information
      sm_table = ActiveRecord::Migrator.schema_migrations_table_name

      sql = String.new
      sql << "INSERT INTO #{sm_table} (version) VALUES\n"
      sql << ActiveRecord::SchemaMigration.order('version').map { |sm|
        "('#{sm.version}')"
      }.join(",\n")
      sql << ";"
    end
  end
end
