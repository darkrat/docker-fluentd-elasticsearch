FROM fluent/fluentd:v1.3-onbuild

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && gem install fluent-plugin-detect-exceptions \
 && apk add --no-cache git \
 && gem install specific_install \
 && sudo gem specific_install https://github.com/darkrat/fluent-plugin-elasticsearch.git\
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.5.0/cache/*.gem
           
# RUN chmod 644 /var/lib/gems/2.5.0/gems/fluent-plugin-detect-exceptions-0.0.11/lib/fluent/plugin/exception_detector.rb
