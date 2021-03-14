FROM migrate/migrate

COPY migration /migration

CMD migrate -database ${POSTGRES_URL} -path /migration up