module EnhancedMySQLTasks
  module Rails41
    module MySQLDatabaseTasks
      def structure_dump(filename)
        args = prepare_command_options('mysqldump')
        args.concat(["--result-file", "#{filename}"])
        args.concat(["--no-data"])
        args.concat(["--routines"])
        args.concat(["--skip-comments"])
        args.concat(["--skip-dump-date"])
        args.concat(["#{configuration['database']}"])

        if Kernel.system(*args)
          sql = File.read(filename)
          File.write(filename, sql.gsub(/ AUTO_INCREMENT=[0-9]+/, ''))
        else
          $stderr.puts "Could not dump the database structure. "\
                       "Make sure `mysqldump` is in your PATH and check the command output for warnings."
        end
      end
    end
  end
end
