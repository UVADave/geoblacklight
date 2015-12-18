FROM centos:7

RUN yum -y install ruby
RUN yum -y install gcc gcc-c++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel libxml2 libxml2-devel libxslt libxslt-devel mysql-devel patch epel-release
RUN yum -y install ruby-rdoc ruby-devel
RUN yum -y install nodejs rubygems
RUN gem install bundler

ENV APP_HOME /geoblacklight
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME
RUN bundle install

EXPOSE 3000
CMD rails server
