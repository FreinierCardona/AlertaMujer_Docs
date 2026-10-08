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
| HU-AM | 20 | Implementación local; integración servidor pendiente de evidencia propia | Frontend |
| HU-DB | 25 | Integradas; HU-DB-025 aplicada | Database |
| HU-API | 19 | Integradas en develop y verificadas contra PostgreSQL local el 2026-10-08 | Backend |

La evidencia actual del Backend es 126 pruebas automáticas, sin fallos, errores ni omisiones, ejecutadas con fixtures sintéticas sobre PostgreSQL 17.11. Esto no declara una entrega productiva ni la recepción en buzón SMTP o dispositivo FCM real.

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

**Relacionados:** [_template-hu.md](./_template-hu.md) · [backend-stories.md](./backend-stories.md) · [traceability-matrix.md](./traceability-matrix.md)
