# Backend — Runbook

> [!NOTE] INSTRUCTIONS
> Estado: En refinamiento. Solo se documentan comandos y perfiles observados en el scaffold; no equivalen a una verificación integrada.

## Objetivo operativo

Definir verificaciones seguras para el scaffold y la futura integración Backend.

## Precondiciones

- Java 21 y acceso a Internet en la primera resolución de Maven Wrapper.
- Configuración del ambiente fuera del repositorio; no registrar secretos.
- Para integración futura, Database migrada y acceso como `alertamujer_app`.

## Arranque local

```powershell
.\mvnw.cmd spring-boot:run
.\mvnw.cmd clean verify
```

El perfil local inicia sin datasource. Los perfiles `test` y `docker` actuales también excluyen datasource/JPA auto-configurados; no intentar conectarlos a Database sin completar HU-API-005.

## Verificación

| Señal | Resultado esperado | Acción si falla |
|---|---|---|
| scaffold | arranca sin intentar DDL o Liquibase | revisar perfiles y propiedades |
| build | `clean verify` termina con código cero | revisar Java 21 y salida Maven |
| integración futura | rol app, esquema validado y pruebas contractuales | detener el cambio y revisar HU/contrato |
| logs | no exponen secretos ni datos personales | retirar dato y rotar secreto si aplica |

## Fallos conocidos

| Síntoma | Diagnóstico | Recuperación |
|---|---|---|
| no conecta a Database | aún no existe perfil integrado o hay red/rol/versión inválidos | no exponer credenciales; completar HU-API-005 |
| endpoint no existe | capacidad pendiente | no simular disponibilidad |

## Escalamiento

Responsables, SLO y canales: **Pendiente**. Conservar versión, perfil, salida relevante y ambiente sin datos sensibles.

## Retorno

La estrategia de rollback de aplicación permanece **Pendiente** hasta definir despliegue. El rollback Liquibase pertenece a Database, no a este runbook.

---

**Relacionados:** [`README.md`](README.md) · [`../../_stacks/java-spring.md`](../../_stacks/java-spring.md) · [`../../13-operations/runbook.md`](../../13-operations/runbook.md)
