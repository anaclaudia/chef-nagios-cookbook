#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'sudo apt-get update'
end

package 'wget' 
package 'build-essential' 
package 'apache2'
package 'php5'
package 'php5-gd'
package 'libgd-dev'
package 'unzip'
package 'apache2-utils'
package 'curl'
