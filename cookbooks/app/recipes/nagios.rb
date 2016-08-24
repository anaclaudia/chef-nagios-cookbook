# Download and extract the source code
tar_extract 'http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.2.0.tar.gz' do
  target_dir '/opt/'
  creates '/opt/nagios-4.2.0/install-sh'
  not_if { File.exists?("/opt/nagios-4.2.0/install-sh")}
end

execute 'rename config dir' do
  command 'mv /opt/nagios-4.2.0 /opt/nagios'
  not_if { File.exists?("/opt/nagios/install-sh")}
end

execute 'configure nagios' do
  cwd '/opt/nagios'
  command 'sudo ./configure --with-command-group=nagcmd --with-httpd-conf=/etc/apache2/'
end

execute 'compile' do
  cwd '/opt/nagios'
  command 'sudo make all && sudo make install && sudo make install-init && sudo make install-config && sudo make install-commandmode && sudo make install-webconf'
end

execute 'copying files' do
  cwd '/opt/nagios'
  command 'cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/'
end

execute 'changing permissions' do
  command 'chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers'
end

execute 'check syntax' do
  command '/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg'
end

execute 'copying nagios vhost conf' do
  cwd '/opt/nagios'  
  command 'sudo /usr/bin/install -c -m 644 sample-config/httpd.conf /etc/apache2/sites-available/nagios.conf'
  not_if { File.exists?("/etc/apache2/sites-available/nagios.conf") }
end

execute 'enabling nagios on apache' do
  command 'sudo a2ensite nagios && sudo a2enmod rewrite cgi'
end

execute 'set nagiosdmin password' do
  command 'htpasswd -cb /usr/local/nagios/etc/htpasswd.users nagiosadmin ddd001'
  not_if { File.exists?("/usr/local/nagios/etc/htpasswd.users") }
end

template '/usr/local/nagios/etc/nagios.cfg' do
  source 'nagios.cfg.erb'
end

template '/usr/local/nagios/etc/objects/appserver.cfg' do
  source 'appserver.cfg.erb'
end

template '/usr/local/nagios/etc/objects/commands.cfg' do
  source 'commands.cfg.erb'
end

execute 'restarting services' do
  command 'sudo service apache2 restart && sudo service nagios restart'
end


