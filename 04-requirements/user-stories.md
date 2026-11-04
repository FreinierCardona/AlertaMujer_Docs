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
| HU-AM | 31 | 001–027 con evidencia histórica; 028–031 con código observado y validación pendiente | Frontend |
| HU-DB | 27 fichas detalladas en este catálogo | 026 tiene changesets; 027 sin retiro físico observado; 028 y 030 en changelog | Database |
| HU-API | 22 | 001–019 con evidencia histórica; 020–022 con código observado y validación pendiente | Backend |

El corte histórico del 2026-10-13 registró 138 pruebas Backend y 3/10 Playwright Web; esos resultados no acreditan cambios posteriores. Los componentes de 028–031 y API-020–022 se observaron en código; el recorrido local de evidencias con Expo Go y consulta por contacto/administrador se confirmó el 2026-11-03. No se declara cierre de todos los criterios ni validación de APK.

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
