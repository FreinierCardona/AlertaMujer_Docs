# Stack — Java y Spring Boot

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. La versión y las dependencias listadas se observaron en el scaffold; no acreditan API, seguridad ni integración funcional.

## Baseline comprobado

| Elemento | Valor observado | Evidencia |
|---|---|---|
| Runtime | Java 21 | propiedad `java.version` del `pom.xml` |
| Framework | Spring Boot 4.1.1 | parent Maven |
| Build | Maven Wrapper | `mvnw` y `mvnw.cmd` |
| Artefacto | `com.alertamujer:alertamujer-backend:0.0.1-SNAPSHOT` | `pom.xml` |
| Paquete raíz | `com.alertamujer` | clase de aplicación |
| Estado | scaffold de HU-API-001 integrado | `develop`; sin endpoints ni dominio |

## Dependencias presentes

| Área | Artefacto o starter | Uso permitido en el estado actual |
|---|---|---|
| REST | `spring-boot-starter-webmvc` | Base MVC; no existen controladores funcionales. |
| Persistencia | `spring-boot-starter-data-jpa`, PostgreSQL | Preparar mapeo y validación futura; no hay conexión configurada. |
| Seguridad | Security y OAuth2 Resource Server | Base para validar JWT HS256 futura; emisión, RBAC y sesiones siguen pendientes. |
| Validación | `spring-boot-starter-validation` | Validaciones de DTO cuando existan endpoints. |
| Utilidades | Lombok | Reducir repetición; no usar `@Data` en entidades JPA. |
| Pruebas | starter test, pruebas MVC/JPA/Security y Testcontainers PostgreSQL | Contexto actual y futuras pruebas reales contra PostgreSQL. |

Las versiones transitivas las administra el parent de Spring Boot. Toda adición se declara en `pom.xml`, se justifica contra una HU y se verifica con el Wrapper.

## Configuración efectiva

| Propiedad o perfil | Estado observado | Implicación |
|---|---|---|
| `spring.liquibase.enabled=false` | Base | Backend no migra ni posee esquema. |
| `spring.jpa.hibernate.ddl-auto=validate` | Base | Nunca se permite crear o modificar DDL desde Hibernate. |
| `local`, `test`, `docker` | Excluyen datasource y JPA auto-configurados | El scaffold inicia sin Database; `docker` no prueba que exista contenedor. |
| `.env.example` | Sin valores reales | Secretos y conexiones quedan fuera de Git. |

La primera integración debe usar exclusivamente `alertamujer_app` contra una release Database ya validada. No se usan `alertamujer_owner` ni `alertamujer_migrator` desde Backend.

## Incorporación por vertical

| Capacidad | Dependencia o mecanismo pendiente | Condición para introducirla |
|---|---|---|
| OTP por correo | `spring-boot-starter-mail` | HU-API-007/008 y SMTP externo configurado. |
| Chat y eventos | `spring-boot-starter-websocket` | HU-API-016 y contrato WSS/STOMP aprobado. |
| Salud operativa | `spring-boot-starter-actuator` | Antes de integración compartida; proteger endpoints fuera de local. |
| Propiedades tipadas | configuration processor | Al crear propiedades para JWT, FCM, evidencia o límites. |
| FCM | `com.google.firebase:firebase-admin` | HU-API-014; un fallo no revierte SOS. |
| Evidencia WebP | Biblioteca ImageIO compatible, probada | HU-API-015; validar conversión y límite antes de adoptarla. |
| Contrato | springdoc o plugin OpenAPI Generator, si se aprueba | Antes de una generación amplia; el YAML fuente conserva autoridad. |

## Exclusiones explícitas

- No añadir Liquibase, Spring Data JDBC, OAuth2 Client, proveedor SMS, Redis, RabbitMQ, Spring Batch, Spring Cloud, SSO, Keycloak, JWKS ni almacenamiento cloud sin cambio de alcance aprobado.
- No tratar la presencia de starters como evidencia de una capacidad implementada.
- No declarar versión independiente para una dependencia gestionada sin una incompatibilidad demostrada.

## Comandos del scaffold

```powershell
.\mvnw.cmd spring-boot:run
.\mvnw.cmd clean verify
```

Estos comandos corresponden al repositorio Backend y al estado actual sin Database. La evidencia de integración se incorpora cuando una HU use PostgreSQL migrado y sus pruebas respectivas.

---

**Relacionados:** [../04-requirements/backend-stories.md](../04-requirements/backend-stories.md) · [../05-architecture/layered-architecture.md](../05-architecture/layered-architecture.md) · [../09-modules/backend/README.md](../09-modules/backend/README.md)
