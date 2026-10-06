# 04 — Requisitos No Funcionales

> [!NOTE] INSTRUCTIONS
> Un requisito sin umbral se marca `En refinamiento`; no se completa con un valor supuesto.

## Qué hace válido un requisito

Debe indicar señal, carga o contexto, valor objetivo y método de prueba. Una intención cualitativa puede guiar diseño, pero no acredita cumplimiento.

## Requisitos

| Id | Atributo | Definición vigente | Verificación / estado |
|---|---|---|---|
| RNF1 | Flujo controlado | Errores no inventan éxito ni pierden contexto crítico. | E2E y fallos inducidos |
| RNF2 | Compatibilidad | Android validado al menos en dispositivo o emulador definido. | matriz: En refinamiento |
| RNF3 | Respuesta SOS | UI responde de inmediato; red/GPS terminan de forma controlada. | timeout cuantitativo: En refinamiento |
| RNF4 | Seguridad | Hashes, JWT, RBAC, sesión revocable, mínimo privilegio y transporte seguro. | pruebas de seguridad |
| RNF5 | Usabilidad | Acciones claras bajo estrés en cuatro idiomas y dos temas. | accesibilidad y pruebas de flujo |
| RNF6 | Tolerancia a fallos | Fallo externo no finaliza emergencia ni declara entrega. | integración degradada |
| RNF7 | Mantenibilidad | Límites de ecosistema, módulos y migraciones inmutables. | revisión + boundary checks |
| RNF8 | Trazabilidad | Estados, ubicación, mensajes, evidencia y auditoría reconstruyen hechos. | consultas y evidencia |
| RNF9 | Observabilidad | `requestId` y logs sin secretos correlacionan solicitudes. | Backend pendiente |
| RNF10 | Privacidad | Datos sensibles solo para actor autorizado y propósito vigente. | RBAC + revisión de logs |

## Identificadores y vacíos

- Los IDs no se reutilizan.
- SLO, p95, concurrencia, capacidad, RTO, RPO, retención y WCAG objetivo están `En refinamiento`.
- Un valor se vuelve vigente solo con fuente, propietario y método de prueba.

---

**Relacionados:** [`../00-governance/documentation-rules.md`](../00-governance/documentation-rules.md) · [`./traceability-matrix.md`](./traceability-matrix.md)
