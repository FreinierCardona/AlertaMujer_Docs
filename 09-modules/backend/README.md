# Backend

> [!NOTE] INSTRUCTIONS
> Estado: Implementado e integrado en develop. Este documento distingue la evidencia automatizada local de la operación en ambientes reales.

## Propósito

Exponer la API Java/Spring Boot, seguridad, reglas transaccionales e integraciones de servidor sin asumir la propiedad de PostgreSQL, Liquibase o interfaces de cliente.

## Responsabilidades

- Identidad, autorización, sesiones, perfil y contactos.
- Orquestación de SOS, ubicación, estados, evidencia, chat, notificaciones y administración.
- Acceso al esquema Database mediante el rol de mínimo privilegio alertamujer_app.
- Correlación HTTP y configuración de orígenes CORS para el Frontend local.

## Fuera de alcance

- Pantallas y experiencia de cliente.
- DDL, changeSets, grants o credenciales de migración.
- Afirmar entrega final SMTP, operación productiva o CI/CD sin evidencia específica; FCM es legado en retiro.

## Entradas y salidas

| Dirección | Elemento | Contrato o fuente |
|---|---|---|
| Entrada | REST y WSS desde Frontend | [../../07-api/README.md](../../07-api/README.md) |
| Salida | respuestas, eventos, consultas e integraciones | contratos de 07-api y HU-API |

## Dependencias

| Dependencia | Motivo | Estado comprobado |
|---|---|---|
| Database | Persistencia PostgreSQL y funciones protegidas | Validada con PostgreSQL 17.11 |
| FCM legado | Intento por contacto elegible | Implementado actualmente; retiro aprobado por ADR-006/HU-API-021 |
| Panel interno | Consulta de alertas/evidencias para contactos | Propuesto en HU-API-022 |
| SMTP | Envío de OTP | Integración de código implementada; entrega de buzón no probada aquí |
| Almacenamiento privado | Evidencias fotográficas | Implementado bajo EVIDENCE_STORAGE_PATH |

## Estado de entrega

| Aspecto | Estado | Evidencia |
|---|---|---|
| HU-API-001 a 019 | Integradas | develop, merge d6b694e de PR #19 |
| Pruebas | Verificadas | 126 pruebas, 0 fallos, 0 errores y 0 omitidas el 2026-10-08 |
| Persistencia | Verificada | PostgreSQL 17.11 con fixtures sintéticas y alertamujer_app |
| REST y WSS/STOMP | Implementados | Controladores, seguridad y pruebas por módulo |
| Docker | Configurado en código | Requiere validación de ambiente antes de una promoción |
| Operación productiva | Pendiente | No hay evidencia de despliegue, SLO ni promoción aprobada |

## Criterio de mantenimiento

- Cada cambio conserva capas controller, service, repository y DTO por módulo.
- El Backend no incorpora migrations ejecutables ni conexiones con usuarios propietarios.
- Los contratos y la trazabilidad se actualizan con el cambio de código.
- Las pruebas declaran con precisión sus límites: simulación de proveedor no equivale a entrega externa.

---

**Relacionados:** [../../04-requirements/backend-stories.md](../../04-requirements/backend-stories.md) · [data-model.md](data-model.md) · [decisions.md](decisions.md) · [readiness.md](readiness.md) · [runbook.md](runbook.md)
