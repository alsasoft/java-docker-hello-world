# Partimos de una versión de Linux estable: Debian Stretch
FROM debian:stretch

# Instalación de Java 8 Update 222
RUN apt-get update
RUN apt-get install -y openjdk-8-jre-headless=8u222-b10-1~deb9u1 openjdk-8-jdk-headless=8u222-b10-1~deb9u1 maven

# Preparación del directorio de trabajo
RUN mkdir -p /usr/src/app
ADD . /usr/src/app
WORKDIR /usr/src/app

# Borrado de binarios
RUN ./delete_vendors.sh

# Compilación y empaquetado
RUN ./compile.sh

# Ejecución
CMD java -jar ./target/HelloWorld-0.0.1-SNAPSHOT.jar