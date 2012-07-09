require 'rails/generators'
require 'rails/generators/migration'

class EasypayGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
   
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
  
  def create_migration_file
    migration_template  'migration.rb', 'db/migrate/create_easypay_tables.rb'
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/easypay.rb'
  end

  # def update_application_template
  #   f = File.open "app/views/layouts/application.html.erb"
  #   layout = f.read; f.close
  #   
  #   if layout =~ /<%=[ ]+yield[ ]+%>/
  #     print "    \e[1m\e[34mquestion\e[0m  Your layouts/application.html.erb layout currently has the line <%= yield %>. This gem needs to change this line to <%= content_for?(:content) ? yield(:content) : yield %> to support its nested layouts. This change should not affect any of your existing layouts or views. Is this okay? [y/n] "
  #     begin
  #       answer = gets.chomp
  #     end while not answer =~ /[yn]/i
  #     
  #     if answer =~ /y/i
  #       
  #       layout.gsub!(/<%=[ ]+yield[ ]+%>/, '<%= content_for?(:content) ? yield(:content) : yield %>')
  # 
  #       tmp_real_path = File.expand_path("tmp/~application.html.erb")
  # 
  #       tmp = File.open tmp_real_path, "w"
  #       tmp.write layout; tmp.close
  # 
  #       remove_file 'app/views/layouts/application.html.erb'
  #       copy_file tmp_real_path, 'app/views/layouts/application.html.erb'
  #       remove_file tmp_real_path
  #     end
  #   elsif layout =~ /<%=[ ]+content_for\?\(:content\) \? yield\(:content\) : yield[ ]+%>/
  #     puts "    \e[1m\e[33mskipping\e[0m  layouts/application.html.erb modification is already done."
  #   else
  #     puts "    \e[1m\e[31mconflict\e[0m  The gem is confused by your layouts/application.html.erb. It does not contain the default line <%= yield %>, you may need to make manual changes to get this gem's nested layouts working. Visit ###### for details."
  #   end
  # end
  
end
