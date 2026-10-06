# 00 — Reglas de Documentación

> [!NOTE] INSTRUCTIONS
> Este bloque nunca se elimina: este documento gobierna el ciclo de vida de los demás. Cualquier excepción debe quedar escrita aquí.

## Ciclo de vida documental

| Estado | Significado | Marcador |
|---|---|---|
| Vacío | Solo estructura e instrucciones | bloque `INSTRUCTIONS` sin contenido confirmado |
| Pendiente | La definición necesaria todavía no existe | `Estado: Pendiente` y criterio de cierre |
| En refinamiento | Existe información parcial o falta una decisión | `Estado: En refinamiento` y diferencia concreta |
| Borrador | Contenido escrito, aún sin segunda revisión | bloque `INSTRUCTIONS` presente |
| Vigente | Contenido confirmado y revisado | bloque retirado por decisión humana |
| Obsoleto | Sustituido, conservado solo como antecedente | enlace obligatorio al reemplazo |

## Reglas

1. **Una pregunta por documento.** Dos preguntas exigen dos documentos o una fuente principal y un enlace.
2. **25–80 líneas.** README y guía SDD se exceptúan del máximo; plantillas respetan el rango.
3. **Tablas y diagramas sobre prosa.** La prosa explica el porqué, no repite catálogos.
4. **Cada afirmación es verificable.** Se nombra fuente, repositorio, fecha o criterio observable.
5. **Enlaces relativos.** Solo repositorios oficiales y fuentes externas usan URL absoluta.
6. **Español profesional.** Identificadores, rutas, código y encabezados de PR conservan su forma técnica.
7. **Fuente única.** Requisitos, contratos, modelo, operación e implementación no se duplican.
8. **Tres estados técnicos separados.** Diseño aprobado, implementación observada y validación ejecutada.
9. **Plantillas inmutables.** Los archivos `_template-*` se copian antes de completar.
10. **Pie obligatorio.** Todo documento del framework termina con `Relacionados`.

## Jerarquía de fuentes

| Tema | Fuente principal |
|---|---|
| Comportamiento funcional | `04-requirements/` y reglas de `02-domain/` |
| Arquitectura y decisiones | `05-architecture/` y ADR |
| Persistencia | `06-data/` y repositorio Database |
| Intercambio | `07-api/` |
| Implementación | Repositorio oficial del ecosistema |
| Estado transversal | `documentation-audit.md` y catálogo de módulos |

## Lista de revisión

- [ ] Responde la pregunta declarada en el README de su sección.
- [ ] No contiene hechos inventados ni marcadores fuera de plantillas.
- [ ] Sus enlaces resuelven y sus diagramas tienen sintaxis balanceada.
- [ ] Distingue responsabilidades Frontend, Backend y Database.
- [ ] Actualiza trazabilidad, ADR, pruebas y CHANGELOG cuando corresponde.
- [ ] Una segunda persona revisó el contenido antes de retirar instrucciones.

---

**Relacionados:** [`definition-of-done.md`](./definition-of-done.md) · [`README.md`](./README.md)
