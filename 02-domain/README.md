# 02 — Dominio

> [!NOTE] INSTRUCTIONS
> Lea contexto antes de esta sección. Mantenga el bloque hasta que entidades, reglas y límites usen el mismo vocabulario en todos los ecosistemas.

## Propósito

Modela el negocio sin depender de pantallas, controladores o tablas físicas y establece qué responsabilidad pertenece a cada área funcional.

## Documentos

| Documento | Responde | Prioridad |
|---|---|---|
| [domain-map.md](./domain-map.md) | ¿Cuáles son las áreas funcionales y cómo colaboran? | ⭐ |
| [entities-and-rules.md](./entities-and-rules.md) | ¿Qué entidades y reglas sostienen el comportamiento? | ⭐ |
| [module-boundaries.md](./module-boundaries.md) | ¿Dónde termina cada módulo y ecosistema? | ⭐ |

## Fuera de alcance

- Definir clases, DTO, endpoints, columnas o índices.
- Asumir que cada área funcional necesita tabla o servicio propio.
- Dividir el sistema en microservicios.
- Resolver detalles de interfaz o despliegue.

## Listo cuando

- [ ] Las áreas usan nombres consistentes con requisitos y módulos.
- [ ] Las reglas tienen identificador, dueño y punto de aplicación.
- [ ] Cada entidad vigente aparece en el modelo Database o se marca no persistente.
- [ ] Las relaciones entre ecosistemas usan contratos explícitos.
- [ ] No existen módulos creados solo para reflejar una pantalla.

---

**Relacionados:** [`../01-context/README.md`](../01-context/README.md) · [`../03-product/README.md`](../03-product/README.md)
