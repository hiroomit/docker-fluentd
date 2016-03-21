FROM fluent/fluentd:latest
MAINTAINER TANIGUCHI Hiroomi <hiroomi.taniguchi@gmail.com>
USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH
RUN gem sources --add https://rubygems.org
RUN rm -rf /home/fluent/.gem/specs/api.rubygems.org%443
RUN rm -rf /home/fluent/.rbenv
RUN gem install --debug fluent-plugin-secure-forward --no-ri --no-rdoc
RUN gem install -V fluent-plugin-elasticsearch --no-ri --no-rdoc

EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
