module EnhancedMySQLTasks
  module Rails42
    module MySQLDatabaseTasks
      def structure_dump(filename)
        args = prepare_command_options
        args.concat(["--result-file", "#{filename}"])
        args.concat(["--no-data"])
        args.concat(["--routines"])
        args.concat(["--skip-comments"])
        args.concat(["--skip-dump-date"])
        args.concat(["#{configuration['database']}"])

        run_cmd('mysqldump', args, 'dumping')
        sql = File.read(filename)
        File.write(filename, sql.gsub(/ AUTO_INCREMENT=[0-9]+/, ''))
      end
    end
  end
end
