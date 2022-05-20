FROM --platform=${TARGETPLATFORM} alpine:latest 

ARG TARGETPLATFORM 
WORKDIR /root 
COPY brook.sh /root/brook.sh 
RUN set -ex \ 
         && apk add --no-cache tzdata \
         && chmod +x /root/brook.sh \ 
         && /root/brook.sh "${TARGETPLATFORM}" \ 
         && rm -fv /root/brook.sh   

ENV TZ=Asia/Shanghai 
ENV ARGS="wsserver -l :443 -p password0" 

CMD /usr/bin/brook $ARGS
