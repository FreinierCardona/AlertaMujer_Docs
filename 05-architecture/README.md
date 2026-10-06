# 05 — Arquitectura

> [!NOTE] INSTRUCTIONS
> Esta sección distingue arquitectura del sistema y forma interna del Backend. Mantenga el bloque hasta la revisión conjunta de los tres ecosistemas.

## Propósito

Define contenedores, límites, capas, módulos, dependencias y controles que impiden mezclar responsabilidades.

## Documentos

| Documento | Responde | Prioridad |
|---|---|---|
| [modular-monolith.md](./modular-monolith.md) | ¿Dónde aplica el monolito modular y dónde no? | ⭐ |
| [layered-architecture.md](./layered-architecture.md) | ¿Cómo se organizan las capas Backend? | ⭐ |
| [module-structure.md](./module-structure.md) | ¿Qué estructura deben respetar los repositorios? | ⭐ |
| [boundary-enforcement.md](./boundary-enforcement.md) | ¿Cómo se detecta una violación de límites? | ⭐ |
| [security-architecture.md](./security-architecture.md) | ¿Qué controles protegen identidad, datos y archivos? | ⭐ |
| [integrations.md](./integrations.md) | ¿Qué integraciones externas existen y cuáles son sus límites? | — |
| [decisions/README.md](./decisions/README.md) | ¿Cómo se registra una decisión? | ⭐ |
| [decisions/_template-adr.md](./decisions/_template-adr.md) | Plantilla ADR | — |
| [_template-architecture-change.md](./_template-architecture-change.md) | Plantilla para analizar un cambio arquitectónico | — |

## Fuera de alcance

- Presentar Backend diseñado como aplicación implementada.
- Convertir módulos Backend en microservicios.
- Permitir que Backend ejecute Liquibase o que Frontend escriba Database.
- Definir despliegue productivo, SLO o secretos aún pendientes.

## Listo cuando

- [ ] Contenedores y repositorios tienen responsabilidad inequívoca.
- [ ] Módulos y capas coinciden con dominio y catálogo.
- [ ] Cada decisión transversal tiene ADR aceptado o propuesto.
- [ ] Boundary checks pendientes están identificados sin inventar CI/CD.
- [ ] Datos, API, UML y módulos usan los mismos nombres.

---

**Relacionados:** [`../04-requirements/README.md`](../04-requirements/README.md) · [`../09-modules/README.md`](../09-modules/README.md)
