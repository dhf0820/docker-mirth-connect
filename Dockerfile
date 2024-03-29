FROM quay.io/aptible/java:oracle-java7

RUN apt-get update && apt-get -y install nginx --no-install-recommends

WORKDIR /usr/local/mirthconnect

ADD templates/mirthconnect/mirthconnect-install-wrapper.sh /usr/local/mirthconnect/mirthconnect-install-wrapper.sh

RUN wget http://downloads.mirthcorp.com/connect/3.3.0.7801.b1804/mirthconnect-3.3.0.7801.b1804-unix.sh\
	&& chmod +x mirthconnect-3.3.0.7801.b1804-unix.sh \
 	&& ./mirthconnect-install-wrapper.sh


ADD templates/etc /etc
ADD templates/mirthconnect /usr/local/mirthconnect

EXPOSE 3000 9661

CMD ./mirthconnect-wrapper.sh
