# [Ecosistema o módulo] — Runbook

> [!NOTE] INSTRUCTIONS
> Incluya solo comandos verificados y acciones reversibles. Nunca incluya credenciales.

## Objetivo operativo

[Qué condición mantiene o recupera este runbook.]

## Precondiciones

- [Acceso o herramienta.]
- [Ambiente identificado.]
- [Respaldo o punto de retorno.]

## Arranque local

```text
[comando verificado o Pendiente]
```

## Verificación

| Señal | Resultado esperado | Acción si falla |
|---|---|---|
| [health/test/log] | [valor] | [acción segura] |

## Fallos conocidos

| Síntoma | Diagnóstico | Recuperación |
|---|---|---|
| [síntoma] | [comprobación] | [paso reversible] |

## Escalamiento

| Condición | Evidencia a conservar | Responsable |
|---|---|---|
| [umbral] | [correlation id/log sin secreto] | [rol/Pendiente] |

## Retorno

[Cómo deshacer el cambio operativo o declarar que está Pendiente.]

---

**Relacionados:** [`README.md`](README.md) · [`../../13-operations/runbook.md`](../../13-operations/runbook.md)
