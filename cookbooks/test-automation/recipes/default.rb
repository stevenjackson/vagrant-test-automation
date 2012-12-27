#
# Cookbook Name:: test-automation
# Recipe:: default
#
# Copyright 2012, Steve Jackson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "firefox"
package "Xvfb"

bash "install_gnome" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  yum -y groupinstall basic-desktop desktop-platform x11 fonts
  EOH
end
