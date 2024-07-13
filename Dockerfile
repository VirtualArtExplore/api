FROM golang:1.22-bullseye

WORKDIR /app

# Faz o download dos modulos GO
COPY go.mod go.sum ./
RUN go mod download

# Copia o codigo fonte
COPY . ./

# Realiza o build do projeto
RUN CGO_ENABLED=0 GOOS=linux go build -o /virtualartexplorer-api
EXPOSE 8080

# Run
CMD ["/virtualartexplorer-api"]
