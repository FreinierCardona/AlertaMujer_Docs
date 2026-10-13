# 04 — Historias de Usuario

> [!NOTE] INSTRUCTIONS
> Este índice no sustituye el detalle de cada catálogo. Una nueva historia usa _template-hu.md y un identificador nunca reutilizado.

## Formato de identificador

| Ecosistema | Patrón | Catálogo |
|---|---|---|
| Frontend | HU-AM-NNN | [frontend-stories.md](./frontend-stories.md) |
| Database | HU-DB-NNN | [database-stories.md](./database-stories.md) |
| Backend | HU-API-NNN | [backend-stories.md](./backend-stories.md) |

## Backlog

| Grupo | Cantidad | Estado | Fuente técnica |
|---|---:|---|---|
| HU-AM | 31 | 001–027 con código integrado; 028–031 propuestas | Frontend |
| HU-DB | 27 | 001–025 integradas; 026–027 propuestas | Database |
| HU-API | 22 | 001–019 integradas y verificadas; 020–022 propuestas | Backend |

La evidencia actual del Backend es 138 pruebas automáticas, sin fallos, errores ni omisiones, ejecutadas el 2026-10-13 con fixtures sintéticas sobre PostgreSQL 17.11. Frontend pasa typecheck/lint/build, pero Playwright solo pasa 3/10 y no existe prueba Mobile en dispositivo. Las HUs propuestas no están implementadas.

## Escribir una historia

1. Identifique necesidad, actor y requisito.
2. Declare ecosistema dueño y dependencias.
3. Escriba criterios Dado / Cuando / Entonces observables.
4. Enlace reglas, ADR, contrato, datos y riesgos.
5. Defina pruebas y evidencia antes de iniciar.
6. Evalúe [Definition of Ready](../00-governance/definition-of-ready.md).

## Estados

| Estado | Significado |
|---|---|
| Pendiente | Falta definición suficiente. |
| Ready | Cumple DoR y puede iniciar. |
| En progreso | Existe trabajo no integrado. |
| Integrada | Está en la rama acordada. |
| Verificada | Pruebas y evidencia acordadas se ejecutaron con resultado satisfactorio. |
| Operativa | Un ambiente real aporta evidencia adicional; no se infiere desde Git. |

---

**Relacionados:** [_template-hu.md](./_template-hu.md) · [change-package-evidence-internal-notifications.md](./change-package-evidence-internal-notifications.md) · [backend-stories.md](./backend-stories.md) · [traceability-matrix.md](./traceability-matrix.md)
