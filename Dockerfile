FROM alpine:3.20 as base
FROM base as builder
RUN apk add --no-cache build-base
ADD endlessh.c Makefile /
RUN make


FROM base

EXPOSE 2222/tcp

ENTRYPOINT ["/endlessh"]

CMD ["-v"]

COPY --from=builder /endlessh /
