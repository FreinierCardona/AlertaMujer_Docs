# 10 — Preparación local

> [!NOTE] INSTRUCTIONS
> Confirme versiones y scripts en cada repositorio. Los comandos genéricos no sustituyen sus README.

## Checkouts

| Ecosistema | Repositorio oficial | Fuente operativa |
|---|---|---|
| Frontend | AlertaMujer_Frontend | package.json, lockfile y README |
| Backend | AlertaMujer_Backend | README y scripts/verify-integration.ps1 |
| Database | AlertaMujer_Database | Compose, Liquibase y scripts |

## Orden recomendado

1. Clonar el repositorio requerido y verificar rama y versión.
2. Configurar variables locales sin incluir secretos en Git.
3. Iniciar o validar dependencias.
4. Ejecutar validaciones.
5. Arrancar el componente cuando corresponda.

## Configuración

- Copiar únicamente archivos de ejemplo existentes.
- Mantener credenciales fuera de Git y documentación.
- No asumir que mocks Frontend equivalen a integración real.
- No usar credenciales owner o migrator desde Backend.

## Backend

Con Database ya migrada y un .env local para alertamujer_app:

    .\mvnw.cmd verify '-Dmaven.compiler.useIncrementalCompilation=false'
    powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\verify-integration.ps1
    .\mvnw.cmd spring-boot:run

Para Maven en Windows host, la URL PostgreSQL usa 127.0.0.1:5434. Dentro del contenedor se usa host.docker.internal:5434. La ejecución integrada de referencia del 2026-10-08 aprobó 126 pruebas sin fallos, errores u omisiones.

## Database

La validación automatizada usa Docker Compose, PostgreSQL, Liquibase y un ambiente desechable. El puerto documentado del contenedor PostgreSQL es 5433; confirme el mapeo local antes de conectar.

## Cierre

El setup está listo cuando las validaciones del ecosistema pasan sin modificar repositorios ajenos ni exponer secretos.

---

**Relacionados:** [../09-modules/README.md](../09-modules/README.md) · [./environments.md](./environments.md) · [../09-modules/backend/runbook.md](../09-modules/backend/runbook.md)
