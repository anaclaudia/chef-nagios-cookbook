require 'serverspec'

set :backend, :exec
set :path, '/sbin:/usr/sbin:/usr/bin:$PATH'
