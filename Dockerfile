FROM ttbb/base:go AS build
COPY . /opt/compile
WORKDIR /opt/compile/pkg
RUN go build -o mysql_mate .

FROM ttbb/mysql:nake

COPY docker-build /opt/mysql/mate

COPY --from=build /opt/compile/pkg/mysql_mate /opt/mysql/mate/mysql_mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/mysql/mate/scripts/start.sh"]
