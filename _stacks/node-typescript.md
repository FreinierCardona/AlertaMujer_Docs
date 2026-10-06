# Stack — Node.js y TypeScript

> [!NOTE] INSTRUCTIONS
> Verifique versiones en `package.json` y lockfile. No mantenga números que puedan divergir.

## Baseline de versión

| Elemento | Versión | Fuente |
|---|---|---|
| Node.js | definida por repositorio si existe | configuración Frontend |
| TypeScript | dependencia bloqueada | lockfile |
| React/Vite | dependencia bloqueada | Web `package.json` |

## Distribución

La aplicación Web organiza presentación, estado, servicios/adaptadores y recursos i18n. El detalle exacto se valida en el repositorio Frontend.

## Control de límites

- Componentes no conocen SQL ni detalles de persistencia Backend.
- Clientes de API concentran contratos y errores.
- Estado simulado permanece distinguible de integración real.
- Tipos de transporte no sustituyen modelos de presentación.

## Migraciones

No aplica a PostgreSQL. Cambios de dependencias conservan lockfile, notas de compatibilidad y pruebas.

## Capas de prueba

| Capa | Alcance |
|---|---|
| estática | TypeScript, lint y formato |
| componente | estados, interacción y accesibilidad |
| integración | navegación, contexto y adaptadores |
| E2E | flujos Web críticos |

## Comandos

Usar únicamente scripts vigentes de `package.json`; registrar comando y resultado final en evidencia.

---

**Relacionados:** [`../09-modules/frontend/README.md`](../09-modules/frontend/README.md) · [`../12-ux-ui/web.md`](../12-ux-ui/web.md)
