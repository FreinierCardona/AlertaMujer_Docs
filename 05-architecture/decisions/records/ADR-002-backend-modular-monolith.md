# ADR-002 — Organizar Backend como monolito modular

> [!NOTE] INSTRUCTIONS
> Esta decisión describe arquitectura objetivo; no la presente como código implementado mientras el repositorio Backend carezca de evidencia.

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

**Decidimos:** implementar el Backend objetivo como una aplicación Spring Boot modularizada por capacidades de negocio.

Los módulos publicarán interfaces internas y ocultarán repositorios, entidades y detalles de integración.

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

## Revisión futura

Revisar ante evidencia de escalado o despliegue independiente por capacidad.

---

**Relacionados:** [`../../modular-monolith.md`](../../modular-monolith.md) · [`../../../02-domain/module-boundaries.md`](../../../02-domain/module-boundaries.md)
