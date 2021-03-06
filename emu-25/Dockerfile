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
RUN mkdir -p ${ANDROID_HOME}  \
 && cd ${ANDROID_HOME} \
 && wget -q -O android-sdk-linux.zip ${ANDROID_BUILD_TOOL} \
 && unzip android-sdk-linux.zip \
 && rm android-sdk-linux.zip \
 && chown -R root:root ${ANDROID_HOME} \
 && echo "y" | android update sdk --all --no-ui --filter platform-tools,tools

# install sdk components
RUN echo "y" | android update sdk --all --no-ui --filter android-25
RUN echo "y" | android update sdk --all --no-ui --filter sys-img-x86-google_apis-25

# create avd
ENV AEMU_DEFAULT_AVD nexus_5
RUN android create avd -d "Nexus 5" -n "$AEMU_DEFAULT_AVD" -t android-25 -g google_apis -b x86 -s WVGA800 -c 512M

ADD start.sh /
CMD ["/start.sh"]
