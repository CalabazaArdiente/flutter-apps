# Usar una imagen base de Alpine
FROM alpine:latest

# Instalar las dependencias necesarias
RUN apk add --no-cache \
    git \
    curl \
    unzip \
    libstdc++ \
    bash

# Descargar e instalar Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1
ENV PATH="$PATH:/flutter/bin"

# Copiar tu aplicación a la imagen
COPY . /app

# Cambiar al directorio de la aplicación
WORKDIR /app


