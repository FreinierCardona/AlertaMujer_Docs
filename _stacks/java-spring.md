# Stack — Java y Spring Boot

> [!NOTE] INSTRUCTIONS
> Estado: Pendiente. La arquitectura selecciona este stack, pero el repositorio Backend no contiene aplicación verificable.

## Baseline de versión

| Elemento | Versión | Fuente |
|---|---|---|
| Java | Pendiente | build futuro |
| Spring Boot | Pendiente | build futuro |
| herramienta build | Pendiente | repositorio Backend |

No fijar una versión hasta que el build aprobado sea la fuente verificable.

## Distribución de módulos

Cada capacidad Backend mantiene dominio, aplicación, adaptadores de entrada y adaptadores de salida. El paquete técnico global no debe permitir saltar límites funcionales.

## Control de límites

- Dependencias internas apuntan a interfaces públicas del módulo proveedor.
- Entidades JPA, si se adoptan, no atraviesan contratos REST.
- Configuración transversal no contiene reglas de negocio.
- Pruebas de arquitectura deben detectar dependencias prohibidas.

## Migraciones

Backend no ejecuta ni posee cambios Liquibase; Database conserva changelog, SQL y rollback.

## Capas de prueba

| Capa | Alcance objetivo |
|---|---|
| unidad | reglas de dominio y casos de uso |
| integración | adaptadores, seguridad y PostgreSQL |
| contrato | OpenAPI, errores y WSS |
| arquitectura | dependencias entre módulos |

## Comandos

Build, test y arranque: **Pendiente** hasta existir configuración real.

---

**Relacionados:** [`../05-architecture/modular-monolith.md`](../05-architecture/modular-monolith.md) · [`../09-modules/backend/README.md`](../09-modules/backend/README.md)
