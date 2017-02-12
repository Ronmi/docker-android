FROM debian:stretch
MAINTAINER Ronmi Ren <ronmi.ren@gmail.com>

# install java
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-8-jdk default-jdk \
 && apt-get clean \
 && rm -fr /var/lib/apt/lists/*

# install deps
RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y \
      git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 \
      curl libqt5widgets5 unzip \
 && apt-get clean \
 && rm -fr /var/lib/apt/lists/*

# install android sdk
ENV ANDROID_BUILD_TOOL https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
ENV ANDROID_HOME /usr/local/share/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN mkdir -p ${ANDROID_HOME} \
 && cd ${ANDROID_HOME} \
 && wget -q -O android-sdk-linux.zip ${ANDROID_BUILD_TOOL} \
 && unzip android-sdk-linux.zip \
 && rm android-sdk-linux.zip \
 && chown -R root:root ${ANDROID_HOME} \
 && echo "y" | android update sdk --all --no-ui --filter platform-tools,tools

# install sdk components
ENV BUILDTOOLS build-tools-25.0.3
ENV FRAMEWORKS android-25
ENV BASICEXTRAS extra-android-support,extra-android-m2repository,extra-google-m2repository
ENV GOOGLEPLAYS extra-google-google_play_services,extra-google-play_billing,extra-google-market_apk_expansion,extra-google-market_licensing
ENV ANDROID_COMPONENTS ${BUILDTOOLS},${FRAMEWORKS},${BASICEXTRAS},${GOOGLEPLAYS}
RUN echo "y" | android update sdk --all --no-ui --filter "${ANDROID_COMPONENTS}"

# install tool to automatically create license agreement file
ADD agree-license.sh /usr/local/bin/

ENV ANDROID_WORKSPACE /workspace
RUN mkdir ${ANDROID_WORKSPACE}
WORKDIR ${ANDROID_WORKSPACE}
