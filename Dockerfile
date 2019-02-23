FROM node:8-jessie-slim
RUN npm install -g ionic
ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=28.0.3 \
    JAVA_HOME="/usr/local/java" \
    JDK_URL="https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"

#JAVA 8 Dowload
RUN 	mkdir "$JAVA_HOME" .java \
	&& curl -o jdk.tar.gz -L -b "oraclelicense=a" -O $JDK_URL \
	&& tar -xzf jdk.tar.gz --strip-components=1 -C "$JAVA_HOME" \
	&& rm jdk.tar.gz

ENV PATH="$JAVA_HOME"/bin:$PATH

RUN     apt-get update \
        &&  apt-get install unzip

# Download Android SDK
RUN 	mkdir "$ANDROID_HOME" .android \
	&& cd "$ANDROID_HOME" \
	&& curl -o sdk.zip $SDK_URL \
	&& unzip -q sdk.zip \
	&& rm sdk.zip \
	&& yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"
#install cordova
RUN npm install -g cordova

#Download gradle
ENV 	GRADLE_VERSION="gradle-5.2.1" \
	GRADLE_URL="https://downloads.gradle.org/distributions/gradle-5.2.1-bin.zip" \
    	GRADLE_HOME="/usr/local/gradle"

RUN	mkdir -p $GRADLE_HOME \
	&& cd $GRADLE_HOME \
	&& curl -o gradle.zip $GRADLE_URL \
	&& unzip -q gradle.zip \
	&& rm gradle.zip 

ENV 	GRADLE_HOME="$GRADLE_HOME/$GRADLE_VERSION"
ENV 	PATH="$GRADLE_HOME"/bin:$PATH
