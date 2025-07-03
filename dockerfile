###########################################
# BASE IMAGE
###########################################
FROM ubuntu as build

RUN apt-get update && apt-get install -y golang-go


ENV GO-111MODULE=off

COPY . .

RUN CO_ENABLED=0 go build -o /app

############################################
# HERE STARTS THE MAGIC OF MULTI STAGE BUILD
############################################

FROM scratch

COPY --from=build /app /app

ENTRYPOINT ["/app"]


