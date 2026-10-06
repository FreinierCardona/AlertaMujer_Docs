# Database — Runbook

> [!NOTE] INSTRUCTIONS
> Ejecute en un ambiente desechable identificado. Revise `$LASTEXITCODE`; Docker en PowerShell puede escribir progreso en stderr.

## Objetivo operativo

Validar que un release Database aplica, revierte y reaplica sin perder integridad ni privilegios.

## Precondiciones

- Docker Desktop disponible y autorizado.
- Puertos y proyecto Compose aislados.
- Checkout Database sin cambios ajenos.
- ReleaseTag exacto identificado.

## Arranque local

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\test-release.ps1 -ReleaseTag <tag>
```

## Verificación

| Señal | Resultado esperado | Acción si falla |
|---|---|---|
| proceso | `$LASTEXITCODE -eq 0` | conservar salida y diagnosticar |
| final | `Release validation passed` | no declarar éxito si falta |
| grants | rol app con mínimo privilegio | validar base nueva |
| ciclo | update, rollback y reapply | limpiar fixtures dependientes |

## Fallos conocidos

| Síntoma | Diagnóstico | Recuperación |
|---|---|---|
| permiso Docker | daemon inaccesible | solicitar acceso autorizado |
| rollback bloqueado | fixture hija existente | limpiar fixture dentro del ambiente desechable |
| checksum | changeset aplicado cambió | restaurar contenido original; crear otro changeSet |

## Escalamiento

Conservar tag, salida, exit code, versión Liquibase y PostgreSQL, sin contraseñas.

## Retorno

Eliminar únicamente los recursos aislados creados por la prueba, después de verificar su nombre exacto.

---

**Relacionados:** [`README.md`](README.md) · [`../../06-data/migrations.md`](../../06-data/migrations.md)
