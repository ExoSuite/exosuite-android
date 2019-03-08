FROM openjdk:8

USER root

# Install Build Essentials

RUN apt-get update && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y

RUN apt-get install -y ruby-full && gem install fastlane

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g yarn react-native-cli

RUN apt-get install -y git autoconf automake build-essential python-dev libtool pkg-config libssl-dev \
    && git clone https://github.com/facebook/watchman.git
RUN cd watchman/ && git checkout v4.9.0 && ./autogen.sh  && ./configure  && make -j3 && make install

RUN rm -rf watchman/ \
    && apt-get remove --purge -y git autoconf automake build-essential python-dev libtool libssl-dev pkg-config --autoremove



