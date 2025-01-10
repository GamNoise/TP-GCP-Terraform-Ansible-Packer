# Image Alpine
FROM golang:alpine AS builder

# Mise en place des variables d'environnements
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    APP_NAME=app-binary

# Changer de repertoire de travail
WORKDIR /src

# Copier les manifestes des modules
COPY go.mod go.sum ./

# Téléchargement des depndances
RUN go mod download

# Copy du Code
COPY . .
# Build de l'app
RUN go build -o /bin/$APP_NAME ./


FROM alpine:latest
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /bin/$APP_NAME ./
RUN chmod +x $APP_NAME
USER appuser
EXPOSE 8080
CMD ["./app-binary"]
