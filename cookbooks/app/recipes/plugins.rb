tar_extract 'http://nagios-plugins.org/download/nagios-plugins-2.1.2.tar.gz' do
  target_dir '/tmp/'
end

execute 'configure plugins' do
  cwd '/tmp/nagios-plugins-2.1.2'
  command 'sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios'
end

execute 'compile plugins' do
  cwd '/tmp/nagios-plugins-2.1.2'
  command 'sudo make && sudo make install'
end

tar_extract 'http://downloads.sourceforge.net/project/nagios/nrpe-2.x/nrpe-2.15/nrpe-2.15.tar.gz' do
  target_dir '/tmp/'
end

execute 'compile nrpe plugins' do
  cwd '/tmp/nrpe-2.15'
  command './configure --enable-command-args --with-nagios-user=nagios --with-nagios-group=nagios --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu'
end

execute 'make' do
  cwd '/tmp/nrpe-2.15'
  command 'sudo make all && sudo make install-plugin && sudo make install-daemon && sudo make install-daemon-config'
end
