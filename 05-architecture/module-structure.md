# 05 — Estructura de Módulos

> [!NOTE] INSTRUCTIONS
> La estructura Backend es objetivo; las estructuras Frontend y Database se verifican en sus repositorios antes de actualizarlas.

## Árbol

```text
AlertaMujer_Frontend/
├── mobile/app/ + mobile/src/modules/
└── web/src/modules/ + web/src/shared/

AlertaMujer_Backend/                         Scaffold HU-API-001 integrado
└── src/main/java/com/alertamujer/
    └── AlertaMujerApplication.java
    # Los módulos siguientes son diseño pendiente:
    [module]/
    ├── controller/
    ├── dto/request/ + dto/response/
    ├── service/ + service/impl/
    ├── repository/
    ├── model/
    └── integration/

AlertaMujer_Database/
├── 01_ddl/ 02_dml/ 03_dcl/ 04_tcl/
├── 05_rollbacks/
├── changelog/ docker/ scripts/
└── README.md
```

## Qué contiene cada área

| Área | Contenido | Fuente de verdad |
|---|---|---|
| Frontend `app/` | rutas, layouts y composición | código Frontend |
| Frontend `src/modules` | pantallas, estado e integración por capacidad | código Frontend |
| Backend scaffold | aplicación raíz, perfiles y prueba de contexto | código Backend observado |
| Backend módulo | contratos internos, caso de uso, persistencia y adaptadores | diseño hasta implementar |
| Database carpetas | SQL forward por tipo y rollback espejo | código Database |

## Reglas independientes del stack

- Ningún cliente accede directamente a PostgreSQL.
- Backend no contiene migrations ejecutables.
- Un módulo no importa internals de otro.
- Contratos públicos se prueban y documentan.
- Archivos de evidencia no se almacenan en la base.

---

**Relacionados:** [`./modular-monolith.md`](./modular-monolith.md) · [`./boundary-enforcement.md`](./boundary-enforcement.md)
