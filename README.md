# CineApp - Sistema de Cartelera de Cine

Este proyecto es una aplicación desarrollada en Java con Spring Boot para gestionar la cartelera de un cine. Permite a los usuarios ver la lista de películas, filtrar por nombre, votar por la película destacada del momento, y ver información detallada sobre las películas. Los administradores tienen funciones adicionales como agregar, editar y eliminar películas.

## Funcionalidades

### Usuarios

- Ver la lista de todas las películas.
- Filtrar las películas por nombre.
- Votar por la película destacada del momento.
- Ver la película destacada del momento.

### Administradores

- Ver la lista de todas las películas.
- Filtrar las películas por nombre.
- Ver la película destacada del momento.
- Agregar una nueva película.
- Editar una película existente.
- Eliminar una película.

## Tecnologías Utilizadas

- Java
- Spring Boot
- Spring Data JPA y Hibernate para la conexión con la base de datos.
- Keycloak para la seguridad y manejo de roles.
- Docker Compose para facilitar la ejecución de los servicios.

## Inicio Rápido

1. Clona el repositorio: `git clone https://github.com/luciapaulinapereyra/cinema-api`
2. Navega al directorio del proyecto: `cd cinema-api`
3. Levanta los servicios usando Docker Compose: `docker-compose up`
4. Accede a la aplicación en [http://localhost:8080](http://localhost:8080)
5. Accede a Swagger para ver los endpoints en [http://localhost:8080/swagger-ui/index.html#/](http://localhost:8080/swagger-ui/index.html#/)

### Configuración adicional para Keycloak

Para que Keycloak funcione correctamente, asegúrate de modificar el archivo de hosts de Windows para permitir el mapeo. Para esto, dirigite al siguiente directorio: Windows ⇒ System 32 ⇒ Drivers ⇒ etc ⇒. Selecciona el archivo hosts y agrega la siguiente línea: 127.0.0.1 keycloak



