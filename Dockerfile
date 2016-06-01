# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:alpine

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/ctrouilh/WebApp/

# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)

RUN apk add --no-cache git \
	&& go get github.com/CiscoZeus/go-zeusclient \
	&& apk del git
RUN go install github.com/ctrouilh/WebApp/
	

# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/WebApp

# Document that the service listens on port 8080.
EXPOSE 8080
