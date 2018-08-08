#!/bin/bash

# spring-config-injection
#
# Copyright (c) 2015-Present Pivotal Software, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The *-config.py program will directly manipulate things like
# configuration files. But it can not directly manipulate the
# environment variables, as that would only affect its process
# hierarchy. So for environment variables, we have it provide
# us with the keys and values on its output stream, and we place
# them in exported environment variables, here - in the parent
# process - which will also be the parent for the application.

echo "starting spring_config"

# when the profile.d scripts are run, DEPS_DIR
# can be used to locate dependencies installed by bin/supply

#__BUILDPACK_INDEX__ gets replaced by bin/supply at cf push

while read key value
do
	export "$key"="$value"
done <<< "`python $DEPS_DIR/__BUILDPACK_INDEX__/spring_config.py`"
