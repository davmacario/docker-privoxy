
FROM alpine:latest

MAINTAINER dmacario

RUN apk --no-cache add privoxy 
COPY privoxy-start.sh /usr/local/bin/
COPY config /etc/privoxy/
RUN chmod +r /etc/privoxy/config && chmod +x /usr/local/bin/privoxy-start.sh

# Rename files to match config
RUN rm /etc/privoxy/config.new
RUN mv /etc/privoxy/default.action.new /etc/privoxy/default.action
RUN mv /etc/privoxy/default.filter.new /etc/privoxy/default.filter
RUN mv /etc/privoxy/match-all.action.new /etc/privoxy/match-all.action
RUN mv /etc/privoxy/regression-tests.action.new /etc/privoxy/regression-tests.action
RUN mv /etc/privoxy/trust.new /etc/privoxy/trust
RUN mv /etc/privoxy/user.action.new /etc/privoxy/user.action
RUN mv /etc/privoxy/user.filter.new /etc/privoxy/user.filter

CMD ["privoxy-start.sh"]
# CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]

EXPOSE 8118
