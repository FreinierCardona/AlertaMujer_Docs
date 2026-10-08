# Backend — Runbook

> [!NOTE] INSTRUCTIONS
> Estado: Verificado para build y PostgreSQL local. No use este runbook como sustituto de un procedimiento de despliegue aprobado.

## Objetivo operativo

Repetir de forma segura la validación del Backend contra una base ya migrada, sin exponer secretos ni atribuir al Backend la propiedad de Liquibase.

## Precondiciones

- Java 21 y acceso inicial a Maven Wrapper.
- AlertaMujer_Database migrada y publicada para el entorno local.
- Archivo .env local fuera de Git con las tres variables de datasource para alertamujer_app.
- Para ejecución desde Windows host, la URL JDBC usa 127.0.0.1:5434; host.docker.internal se reserva para el contenedor.

## Validación

Ejecute la suite sin borrar target cuando OneDrive o el IDE puedan tener archivos bloqueados:

    .\mvnw.cmd verify '-Dmaven.compiler.useIncrementalCompilation=false'

Para cargar de manera controlada las variables de datasource desde .env y ejecutar las integraciones con fixtures sintéticas:

    powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\verify-integration.ps1

El corte del 2026-10-08 terminó con 126 pruebas, 0 fallos, 0 errores y 0 omitidas contra PostgreSQL 17.11. El script no aplica Liquibase, no modifica .env y utiliza un JWT efímero para pruebas.

## Arranque local

1. Copie .env.example a .env sin versionar secretos.
2. Defina SPRING_DATASOURCE_USERNAME como alertamujer_app.
3. Cargue solo las variables necesarias en la sesión y reemplace host.docker.internal por 127.0.0.1 para Maven host.
4. Inicie:

    .\mvnw.cmd spring-boot:run

La API escucha en http://localhost:8080/api/v1 y la salud técnica está en http://localhost:8080/actuator/health.

## Diagnóstico

| Señal | Interpretación | Acción segura |
|---|---|---|
| Build falla por archivos target bloqueados | Estado incremental o bloqueo OneDrive/IDE | Cerrar el proceso y repetir verify; no atribuirlo al código sin revisar reportes |
| SQLState 28P01 | Credencial local desactualizada | Sincronizar .env con la configuración Database sin mostrar ni versionar valores |
| Conexión rechazada desde host | URL Docker usada fuera de Docker | Usar 127.0.0.1:5434 para la ejecución host |
| Health 503 con REST/DB iniciados | Contribuidor SMTP no disponible | Revisar el componente SMTP antes de afirmar indisponibilidad total |
| Resultado FCM aceptado | Firebase aceptó el intento | No afirmar llegada o lectura en dispositivo |
| Endpoint protegido devuelve 401/403 | Falta o no es válida la identidad vigente | Revisar token, sesión, rol, propiedad y estado |

## Docker

Compose inicia solo Backend; PostgreSQL y Liquibase se administran desde AlertaMujer_Database. Use host.docker.internal:5434 dentro del contenedor y conserve EVIDENCE_STORAGE_PATH en un volumen privado. La validación de un despliegue Docker del ambiente objetivo queda pendiente.

## Retorno

El rollback de aplicación, promoción y escalamiento requieren una política de despliegue aprobada. El rollback Liquibase pertenece al repositorio Database.

---

**Relacionados:** [README.md](README.md) · [../../10-devops/local-setup.md](../../10-devops/local-setup.md) · [../../13-operations/runbook.md](../../13-operations/runbook.md)
