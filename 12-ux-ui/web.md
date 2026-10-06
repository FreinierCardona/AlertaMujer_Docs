# 12 — Experiencia Web

> [!NOTE] INSTRUCTIONS
> Verifique cada capacidad administrativa contra requisito, rol y Backend. No infiera permisos desde la visibilidad de un botón.

## Usuario y propósito

Web soporta tareas de operación autorizada y consulta controlada según roles todavía por cerrar completamente.

## Áreas funcionales

| Área | Resultado esperado | Estado |
|---|---|---|
| acceso | autenticación y sesión segura | interfaz implementada; integración pendiente |
| tablero | resumen operativo comprensible | mocks/estado local |
| emergencias | consultar y atender según autorización | contrato pendiente |
| usuarios | operaciones permitidas y auditadas | En refinamiento |
| auditoría | consulta restringida | En refinamiento |

## Estados obligatorios

- Cargando, datos, sin resultados, error y acceso denegado.
- Filtros y paginación conservan estado de forma predecible.
- Operaciones destructivas requieren confirmación y resultado.
- Las acciones ocultas también se rechazan en Backend.

## Diseño responsivo

Definir puntos de quiebre desde la implementación verificada. Tablas deben conservar comprensión, encabezados y navegación por teclado.

## Accesibilidad

Orden de foco, landmarks, encabezados, nombres accesibles, contraste y mensajes de error asociados a controles.

## Pendientes

- Matriz final de roles administrativos.
- Contratos reales de consulta y atención.
- Criterios aprobados para eliminación de cuenta.

---

**Relacionados:** [`./_template-screen.md`](./_template-screen.md) · [`../05-architecture/security-architecture.md`](../05-architecture/security-architecture.md)
