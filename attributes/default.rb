#
# Cookbook Name:: rsyslog
# Attributes:: rsyslog
#
# Copyright 2009, Opscode, Inc.
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

default.rsyslog.log_dir                              = "/var/log/riot/rsyslog"
default.rsyslog.server                               = false
default.rsyslog.protocol                             = "udp"
default.rsyslog.port                                 = "514"
default.rsyslog.server_ip                            = nil
default.rsyslog.server_search                        = "role:loghost"
default.rsyslog.remote_logs                          = true
default.rsyslog.per_host_dir                         = "%fromhost%/%$YEAR%/%$MONTH%/%$DAY%"
default.rsyslog.max_message_size                     = "2k"
default.rsyslog.preserve_fqdn                        = "off"
default.rsyslog.version                              = "v7"
default.rsyslog.escape_control_characters_on_receive = "off"

# Collect stats every 60 seconds. This might need
# to be lower or higher depending on load and
# desired frequency of reporting.
default.rsyslog.stats.interval                       = "60"

# The most likely platform-specific attributes
default.rsyslog.service_name                         = "rsyslog"
default.rsyslog.user                                 = "root"
default.rsyslog.group                                = "root"
default.rsyslog.priv_seperation                      = false
default.rsyslog.defaults_file                        = "/etc/default/rsyslog"

# Repo configs
default.rsyslog.repo.devel_repo_url                  = "http://rpms.adiscon.com/v7-devel/epel-$releasever/$basearch"
default.rsyslog.repo.stable_repo_url                 = "http://rpms.adiscon.com/v7-stable/epel-$releasever/$basearch"

# Log rotate settings
default.rsyslog.log_rotate.rotate                    = "2"
case node.platform
when "ubuntu"
  # syslog user introduced with natty package
  if node.platform_version.to_f < 10.10 then
    default.rsyslog.user = "syslog"
    default.rsyslog.group = "adm"
    default.rsyslog.priv_seperation = true
  end
when "redhat"
  default.rsyslog.defaults_file = "/etc/sysconfig/rsyslog"
when "arch"
  default.rsyslog.service_name = "rsyslogd"
end
