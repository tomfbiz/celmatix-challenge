namespace :db do
  desc "Dump DB structure in SQL to a file"
  task :structure_with_name, [:file_name] => :environment do |_task, args|
    configuration = {
      "adapter"  => adapter,
      "database" => database_name,
    }
    file = ActiveRecord::Tasks::DatabaseTasks.structure_dump(configuration, file_name(args))

    if file
      puts "Successfully created structure dump in #{file.path}"
    else
      puts "An error occured creating the sturcture dump to file #{file_name}"
    end
  end

  private

  def database_name
    # ENV variable is set in production.
    ENV["DATABASE_URL"] || ActiveRecord::Base.connection_config[:database]
  end

  def file_name(args)
    args.with_defaults(file_name: "sqldump.sql")
    "tmp/#{args.file_name}"
  end

  def adapter
    ActiveRecord::Base.connection_config[:adapter]
  end
end
