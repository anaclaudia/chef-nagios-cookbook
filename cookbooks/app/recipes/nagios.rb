# Download and extract the source code
tar_extract 'http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.2.0.tar.gz' do
  target_dir '/opt/'
  creates '/opt/nagios-4.2.0/install-sh.sh'
end

execute 'rename config dir' do
  command 'mv /opt/nagios-4.2.0 /opt/nagios'
  not_if { File.exists?("/opt/nagios/install-sh.sh")}
end
