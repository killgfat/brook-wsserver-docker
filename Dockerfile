FROM alpine:latest 
USER root
WORKDIR /root 

ENV TZ=Asia/Shanghai 
ENV PASSWORD="password" 

RUN apk update && apk add tzdata bash curl && cp /usr/share/zoneinfo/"${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone && apk del tzdata
RUN bash <(curl https://bash.ooo/nami.sh) && bash <(curl https://bash.ooo/brook.sh)


EXPOSE 443
CMD /usr/bin/brook wsserver -l :443 -p ${PASSWORD}
