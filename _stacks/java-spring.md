# Stack — Java y Spring Boot

> [!NOTE] INSTRUCTIONS
> Estado: Implementado en Backend y verificado con pruebas locales e integración PostgreSQL. Las operaciones de proveedor y despliegue requieren evidencia independiente.

## Baseline comprobado

| Elemento | Valor observado | Evidencia |
|---|---|---|
| Runtime | Java 21 | pom.xml y suite ejecutada |
| Framework | Spring Boot 4.1.1 | parent Maven |
| Build | Maven Wrapper | mvnw y mvnw.cmd |
| Artefacto | com.alertamujer:alertamujer-backend:0.0.1-SNAPSHOT | pom.xml |
| Paquete raíz | com.alertamujer.backend | módulos implementados |
| Estado | HU-API-001 a 019 integradas | develop, PR #1 a #19 |

## Capacidades presentes

| Área | Mecanismo |
|---|---|
| REST y validación | Spring MVC, Validation, DTO y manejador de errores común |
| Persistencia | JPA, JDBC y PostgreSQL con alertamujer_app |
| Seguridad | Spring Security, BCrypt, JWT HS256 y sesiones revocables |
| WebSocket | STOMP para chat y eventos de estado posteriores al commit |
| Correo | JavaMailSender para OTP |
| FCM legado | Firebase HTTP v1 existente; retirar dependencia/adaptador por HU-API-021 |
| Operación | Actuator health y jobs programados |
| Pruebas | JUnit, Mockito, MVC e integración contra PostgreSQL migrado |

## Configuración efectiva

| Propiedad o perfil | Regla |
|---|---|
| spring.liquibase.enabled=false | Backend no migra ni posee esquema |
| spring.jpa.hibernate.ddl-auto=validate | Hibernate no crea ni modifica DDL |
| local y test | Exigen datasource cuando se ejecuta integración |
| docker | Consume configuración externa y no inicia PostgreSQL |
| CORS_ALLOWED_ORIGINS | Lista explícita de orígenes web sin comodines |
| .env.example | Solo marcadores; secretos fuera de Git |

## Comandos verificados

    .\mvnw.cmd verify '-Dmaven.compiler.useIncrementalCompilation=false'
    powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\verify-integration.ps1

El segundo comando finalizó el 2026-10-08 con 126 pruebas, 0 fallos, 0 errores y 0 omitidas sobre PostgreSQL 17.11.

## Exclusiones explícitas

- No añadir Liquibase, Spring Data JDBC, OAuth2 Client, proveedor SMS, Redis, RabbitMQ, Spring Batch, Spring Cloud, SSO, Keycloak, JWKS ni almacenamiento cloud sin cambio de alcance aprobado.
- No tratar la presencia de un starter o una prueba simulada como evidencia de entrega externa.
- No declarar una versión independiente de dependencia administrada sin incompatibilidad demostrada.

---

**Relacionados:** [../04-requirements/backend-stories.md](../04-requirements/backend-stories.md) · [../05-architecture/layered-architecture.md](../05-architecture/layered-architecture.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
