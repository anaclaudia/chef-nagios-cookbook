# Create user

user node['user']['name'] do
  action :create
  home "/home/#{node['user']['name']}"
  password node['user']['password']
  shell "/bin/bash"
  supports manage_home: true
  not_if "grep #{node['user']['name']} /etc/passwd", :user => "#{node['user']['name']}"
end

# Create group
group node['group'] do
  action :create
  members node['user']['name']
  append true
  not_if "grep #{node['group']} /etc/group", :group => "#{node['group']}"
end

#Add user nagios to group nagioscmd

execute 'add-group' do
  command 'usermod -a -G nagios,nagcmd www-data'
end
