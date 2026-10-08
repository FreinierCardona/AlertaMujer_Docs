# 04 — Requisitos No Funcionales

> [!NOTE] INSTRUCTIONS
> Un RNF define una cualidad verificable. No transforme una intención en evidencia sin prueba y ambiente identificables.

## Requisitos

| Id | Cualidad | Resultado verificable | Estado de evidencia Backend |
|---|---|---|---|
| RNF1 | Flujo controlado | Errores no inventan éxito ni pierden contexto crítico. | Contrato HTTP y suites MVC verificados |
| RNF2 | Compatibilidad | Android validado al menos en dispositivo o emulador definido. | Pendiente de evidencia Frontend |
| RNF3 | Respuesta SOS | UI responde de inmediato; red/GPS terminan de forma controlada. | Estado y timeout Backend verificados; umbral UI pendiente |
| RNF4 | Seguridad | Hashes, JWT, RBAC, sesión revocable, mínimo privilegio y transporte seguro. | JWT, autorización, grants y PostgreSQL verificados |
| RNF5 | Usabilidad | Acciones claras bajo estrés en cuatro idiomas y dos temas. | Pendiente de evidencia Frontend |
| RNF6 | Tolerancia a fallos | Fallo externo no finaliza emergencia ni declara entrega. | FCM, archivos y transiciones cubiertos en pruebas |
| RNF7 | Mantenibilidad | Límites de ecosistema, módulos y migraciones inmutables. | Arquitectura modular y separación de Liquibase verificadas |
| RNF8 | Trazabilidad | Estados, ubicación, mensajes, evidencia y auditoría reconstruyen hechos. | Historial, auditoría e intentos persistidos verificados |
| RNF9 | Observabilidad | requestId y logs sin secretos correlacionan solicitudes. | Filtro y contrato de error verificados; alertas/SLO pendientes |
| RNF10 | Privacidad | Datos sensibles solo para actor autorizado y propósito vigente. | Roles, propiedad y rutas privadas cubiertos en suite |

La evidencia Backend de este corte es la suite integrada del 2026-10-08: 126 pruebas, 0 fallos, 0 errores y 0 omitidas contra PostgreSQL 17.11. No sustituye una prueba de producción, TLS desplegado, buzón SMTP o dispositivo FCM.

---

**Relacionados:** [functional.md](./functional.md) · [traceability-matrix.md](./traceability-matrix.md) · [../05-architecture/security-architecture.md](../05-architecture/security-architecture.md)
