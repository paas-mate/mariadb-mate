FROM ttbb/mariadb:nake

COPY docker-build /opt/mariadb/mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/mariadb/mate/scripts/start.sh"]
