FROM fluent/fluentd:v1.3-onbuild

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && apk add --no-cache git \
 #&& gem install specific_install \
 #&& sudo gem specific_install https://github.com/darkrat/fluent-plugin-out-elk.git\
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.5.0/cache/*.gem
