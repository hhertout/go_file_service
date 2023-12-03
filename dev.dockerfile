FROM golang:1.20-alpine

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

RUN go install github.com/mitranim/gow@latest

COPY . .

# Run tests : go test ./tests

CMD ["gow", "run", "."]