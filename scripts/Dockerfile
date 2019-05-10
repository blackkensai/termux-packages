# Build with:
#	docker build -t termux/package-builder .
# Push to docker hub with:
#	docker push termux/package-builder
# This is done after changing this file or any of the
# scripts/setup-{ubuntu,android-sdk}.sh setup scripts.
FROM ubuntu:19.04

# Fix locale to avoid warnings:
ENV LANG C.UTF-8


RUN apt-get update && apt-get install -yq ca-certificates

COPY ./sources.list /etc/apt/

# Setup needed packages and the Android SDK and NDK:
RUN apt-get update && \
	apt-get -yq upgrade && \
	apt-get install -yq sudo wget && \
	adduser --disabled-password --shell /bin/bash --gecos "" builder && \
	echo "builder ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/builder && \
	chmod 0440 /etc/sudoers.d/builder
# Needed for setup:
COPY ./setup-ubuntu.sh ./properties.sh /tmp/
RUN	su - builder -c /tmp/setup-ubuntu.sh
COPY ./setup-android-sdk.sh /tmp/
RUN	su - builder -c /tmp/setup-android-sdk.sh
	# Removed unused parts to make a smaller Docker image:
RUN	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	cd /home/builder/lib/android-ndk/ && \
	rm -Rf sources/cxx-stl/system && \
	cd /home/builder/lib/android-sdk/tools && \
	rm -Rf emulator* lib* proguard templates

# Switch User
USER builder:builder

# We expect this to be mounted with '-v $PWD:/home/builder/termux-packages':
WORKDIR /home/builder/termux-packages

