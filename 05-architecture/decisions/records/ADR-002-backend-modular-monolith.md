# ADR-002 — Organizar Backend como monolito modular

> [!NOTE] INSTRUCTIONS
> Esta decisión describe la arquitectura implementada en Backend. La evidencia local no sustituye un despliegue operativo.

## Identificación

| Campo | Valor |
|---|---|
| Id | ADR-002 |
| Fecha | Pendiente |
| Estado | Accepted |
| Autores | Pendiente |
| Sustituye | Ninguno |

## Contexto

El Backend debe coordinar identidad, emergencias, evidencia, chat y notificaciones. Varias operaciones requieren consistencia transaccional, pero cada capacidad necesita límites internos verificables.

| Restricción | Fuente |
|---|---|
| Un despliegue Backend | Arquitectura vigente |
| Separación por capacidad | Mapa de dominio |
| PostgreSQL compartido por esquemas | Modelo Database |

## Decisión

**Decidimos:** implementar el Backend como una aplicación Spring Boot modularizada por capacidades de negocio.

Los módulos mantienen límites internos y ocultan repositorios, entidades y detalles de integración.

## Alternativas evaluadas

| Alternativa | Ventajas | Costos | Veredicto |
|---|---|---|---|
| Monolito modular | Transacciones simples y límites explícitos | Disciplina de dependencias | Elegida |
| Microservicios | Despliegue independiente | Complejidad operativa no justificada | Descartada |
| Monolito por capas globales | Estructura inicial simple | Acoplamiento entre dominios | Descartada |

## Consecuencias

| Tipo | Consecuencia |
|---|---|
| Positiva | Un solo proceso preserva coherencia transaccional |
| Costo | Se requieren pruebas de límites modulares |
| Riesgo | Dependencias cruzadas pueden erosionar los módulos |

**Documentos a actualizar:** estructura modular y catálogo Backend.

## Evidencia de implementación

Los módulos shared, identity, contacts, emergency, notification, evidence, chat y administration están integrados en develop a través de las HU-API-001 a 019. La suite integrada ejecutada el 2026-10-08 aprobó 126 pruebas contra PostgreSQL 17.11, sin fallos, errores ni omisiones.

## Revisión futura

Revisar ante evidencia de escalado o despliegue independiente por capacidad.

---

**Relacionados:** [`../../modular-monolith.md`](../../modular-monolith.md) · [`../../../02-domain/module-boundaries.md`](../../../02-domain/module-boundaries.md)
