FROM edbizarro/gitlab-ci-pipeline-php:7.4

# install patch, jq, composer and configure composer and git
RUN sudo rm -rf /usr/local/etc/php/conf.d/zz-conf.ini \
    && echo "memory_limit=2G" | sudo tee -a /usr/local/etc/php/conf.d/zz-conf.ini \
    && git config --global user.name "gitlab-acquia-CI" \
    && git config --global user.email "noreply@acquia.io" \
    && sudo apt-get update && sudo apt-get dist-upgrade -y \
    && sudo apt-get install patch \
    && sudo apt-get install jq xxd nodejs ruby-full -y && sudo npm install npm@latest -g \
    && sudo composer self-update --2

RUN curl -OL https://github.com/acquia/cli/releases/download/1.14.0/acli.phar \
    && chmod +x acli.phar && sudo mv acli.phar /usr/local/bin/acli
