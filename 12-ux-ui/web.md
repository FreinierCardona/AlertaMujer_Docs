# 12 — Experiencia Web

> [!NOTE] INSTRUCTIONS
> Verifique cada capacidad administrativa contra requisito, rol y Backend. No infiera permisos desde la visibilidad de un botón.

## Usuario y propósito

Web presenta páginas públicas y tareas administrativas; el código exige sesión para las rutas administrativas y Backend restringe `/api/v1/admin/**` a `ENTITY_ADMIN`.

## Áreas funcionales

| Área | Resultado esperado | Estado |
|---|---|---|
| acceso | inicio, renovación y cierre de sesión | `AdminLogin` y `authApi`; validación integrada pendiente |
| tablero | contadores operativos | `Dashboard` y `/api/v1/admin/dashboard` |
| emergencias | consultar, ver detalle y solicitar atención | `AlertsList`, `AlertDetail` y `adminEmergencyApi` |
| usuarios | consultar, crear, cambiar estado y solicitar eliminación | `UsersList`, `UserDetail`, `CreateUserForm` y `adminUsersApi` |
| auditoría | consultar registros | `AuditPage` y `/api/v1/admin/audit-logs` |

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

- Validar los flujos en navegador con una sesión real, permisos y datos del ambiente elegido.
- Verificar accesibilidad y diseño responsivo; la existencia de componentes no demuestra su cumplimiento.

---

**Relacionados:** [`./_template-screen.md`](./_template-screen.md) · [`../05-architecture/security-architecture.md`](../05-architecture/security-architecture.md)
