---------bash image--------
FROM ubuntu as build

RUN apt-get update && apt-get install -y golang:1.XX

ENV GO-111MODULE=off

COPY . .

RUN CO_ENABLED=0 go build -o /app

------mutli stage with scratch-------

FROM scratch

COPY --from=build /app /app

ENTRYPOINT ["/app"]


