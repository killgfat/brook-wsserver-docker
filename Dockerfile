FROM alpine:latest 
USER root
WORKDIR /root 

ENV TZ=Asia/Shanghai 
ENV PASSWORD="password" 

RUN apk update && apk add tzdata bash wget && cp /usr/share/zoneinfo/"${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone && apk del tzdata
RUN wget https://github.com/txthinking/brook/releases/latest/download/brook_linux_amd64 && chmod 777 brook_linux_amd64 && mv ./brook_linux_amd64 /usr/bin/brook


EXPOSE 443
CMD /usr/bin/brook wsserver -l :443 -p ${PASSWORD}
