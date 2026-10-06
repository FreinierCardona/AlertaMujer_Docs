# Backend — Runbook

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente. No invente comandos de una aplicación que todavía no existe en el repositorio.

## Objetivo operativo

Definir las verificaciones mínimas cuando Backend cuente con implementación ejecutable.

## Precondiciones

- Código Backend y herramienta de build verificables.
- Configuración del ambiente fuera del repositorio.
- Database disponible con migraciones compatibles.

## Arranque local

```text
Pendiente: definir desde el build real del repositorio Backend.
```

## Verificación

| Señal | Resultado esperado | Acción si falla |
|---|---|---|
| health | estado saludable sin datos sensibles | revisar configuración |
| migración compatible | versión esperada | detener arranque incompatible |
| contrato | pruebas aprobadas | corregir código o contrato |
| logs | correlación disponible | revisar observabilidad |

## Fallos conocidos

| Síntoma | Diagnóstico | Recuperación |
|---|---|---|
| no conecta a Database | red, rol o versión | validar sin revelar credenciales |
| endpoint no existe | implementación pendiente | no simular disponibilidad |

## Escalamiento

Responsables, SLO y canales: **Pendiente**. Conservar correlación, versión y ambiente.

## Retorno

La estrategia de rollback de aplicación permanece **Pendiente** hasta definir despliegue.

---

**Relacionados:** [`README.md`](README.md) · [`../../13-operations/runbook.md`](../../13-operations/runbook.md)
