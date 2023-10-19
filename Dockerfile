FROM alpine:latest

RUN apk --no-cache add \
  bats \
  git \
  util-linux

WORKDIR /git-add-card

COPY . /git-add-card

CMD [ "./test/git-add-card.bats" ]
