# 08 — Índice de diagramas

> [!NOTE] INSTRUCTIONS
> Actualice una vista solo junto con su documento propietario. Estado Backend: arquitectura objetivo sin implementación verificada.

## Contexto del sistema

```mermaid
flowchart LR
  U[Usuaria] --> M[Frontend Mobile]
  O[Operador autorizado] --> W[Frontend Web]
  M -->|REST / WSS| B[Backend objetivo]
  W -->|REST / WSS| B
  B -->|SQL| D[(PostgreSQL)]
  L[Liquibase] --> D
  B -.-> F[FCM pendiente de integración]
```

Fuente: [arquitectura](../05-architecture/README.md).

## Inicio SOS objetivo

```mermaid
sequenceDiagram
  actor U as Usuaria
  participant F as Frontend
  participant B as Backend
  participant D as Database
  U->>F: confirma SOS
  F->>B: solicita emergencia
  B->>D: crea emergencia e historial
  D-->>B: identificador y estado
  B-->>F: emergencia confirmada
  F-->>U: muestra seguimiento
```

Fuente: [flujo funcional](../03-product/functional-flow.md). Idempotencia: **Pendiente**.

## Estados de emergencia

```mermaid
stateDiagram-v2
  [*] --> Activa
  Activa --> Atendida: atención autorizada
  Activa --> Cancelada: cancelación válida
  Atendida --> Cerrada: cierre autorizado
  Cancelada --> [*]
  Cerrada --> [*]
```

Los nombres definitivos se verifican en Database antes de implementar Backend.

## Agregado de emergencia

```mermaid
erDiagram
  EMERGENCIES ||--o{ EMERGENCY_STATUS_HISTORY : historial
  EMERGENCIES ||--o{ EMERGENCY_LOCATIONS : ubicaciones
  EMERGENCIES ||--o{ EMERGENCY_EVIDENCES : evidencias
  EMERGENCIES ||--o{ EMERGENCY_CHAT_MESSAGES : mensajes
  EMERGENCIES ||--o{ EMERGENCY_NOTIFICATION_ATTEMPTS : intentos
```

Fuente: [modelo de datos](../06-data/models.md).

## Reglas de mantenimiento

- Una vista por pregunta, sin duplicar catálogos completos.
- Etiquetar explícitamente lo objetivo o pendiente.
- Enlazar desde el índice de la sección.
- Revisar después de cada ADR o cambio de contrato relacionado.

---

**Relacionados:** [`../02-domain/domain-map.md`](../02-domain/domain-map.md) · [`../07-api/README.md`](../07-api/README.md)
