#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
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

### TEMPORARY TESTING COPY ###
#
# This file has been temporarily copied into omnibus-chef to override
# the omnibus-software definition for testing with Cisco IOS-XR devices
# on Wind River Linux 7.  This file should be removed and omnibus-chef
# configured back to ride master whenever the WRL7-related ohai PRs
# are merged.
#
### TEMPORARY TESTING COPY ###

name "ohai"
default_version "8.5.1.cisco.wrl7"

source git: "git://github.com/adamleff/ohai"

relative_path "ohai"

if windows?
  dependency "ruby-windows"
  dependency "ruby-windows-devkit"
else
  dependency "ruby"
end

dependency "rubygems"
dependency "bundler"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install --without development", env: env

  gem "build ohai.gemspec", env: env
  gem "install ohai*.gem" \
      " --no-ri --no-rdoc", env: env
end