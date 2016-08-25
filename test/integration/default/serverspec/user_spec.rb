describe user('nagios') do
  it { should exist }
  it { should belong_to_group 'nagios' }
  it { should belong_to_group 'nagcmd' }
end
