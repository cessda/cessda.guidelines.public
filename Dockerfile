# Copyright CESSDA ERIC 2020
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM jekyll/builder AS build
WORKDIR /jekyllwork/

# Make the jekyllwork directory writable
RUN chmod 777 /jekyllwork/

# Install Gem dependencies
COPY Gemfile ./
RUN bundle install

# Build the site
COPY . .
RUN jekyll build

# Hosting with Nginx
FROM nginx:1.16 AS final

# Copy configuration and html
COPY nginx/nginx.conf /etc/nginx/
COPY --from=build /jekyllwork/_site/ /usr/share/nginx/html/
