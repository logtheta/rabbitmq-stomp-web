FROM haproxy:1.7.11-alpine

COPY config/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

# Server statistics
EXPOSE 9090
# Web UI
EXPOSE 80
EXPOSE 443
# Web API
EXPOSE 8080
# AMQP
EXPOSE 5672
# MQTT
EXPOSE 1883
# STMOP WEB
EXPOSE 15674
