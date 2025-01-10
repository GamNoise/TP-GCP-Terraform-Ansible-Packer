# Étape 1 : Construction de l'application
FROM golang:1.20 AS builder

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers go.mod et go.sum pour télécharger les dépendances
COPY go.mod go.sum ./
RUN go mod download

# Copier le reste des fichiers de l'application
COPY . .

# Compiler l'application
RUN go build -o main .

# Étape 2 : Image finale pour l'exécution
FROM alpine:latest

# Définir le répertoire de travail
WORKDIR /root/

# Copier l'application construite depuis l'étape précédente
COPY --from=builder /app/main .

# Copier les fichiers nécessaires pour l'exécution (si applicable)
COPY templates/ ./templates

# Exposer le port par défaut (à ajuster si différent)
EXPOSE 8080

# Commande pour exécuter l'application
CMD ["./main"]
