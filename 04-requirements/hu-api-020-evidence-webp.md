# HU-API-020 — Aceptar y normalizar evidencia WebP hasta 500 KB

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Backend no cambia DDL; exige la release HU-DB-026 antes de validarse.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Backend |
| Módulo | Evidence |
| Objetivo | Unificar validación y persistencia de WebP final hasta 500 000 bytes. |
| Alcance | Multipart, MIME/firma, dimensiones, almacenamiento, compensación y DTO. |
| Precondiciones | Alerta propia abierta; máximo diez evidencias; directorio privado escribible. |
| Dependencias | ADR-007, HU-DB-026, HU-AM-028. |
| Candidatos | `EvidenceController`, `EvidenceService`, `LocalEvidenceStorage`, properties y pruebas. |
| Resultado | Ningún archivo/registro final supera 500 KB ni queda huérfano por fallo. |

## Descripción

Aceptar solo WebP del cliente, verificar contenido real, re-encodear si se necesita normalización y persistir metadata únicamente después de escritura válida.

## Criterios de aceptación

```gherkin
Escenario: evidencia válida
  Dado alerta propia abierta y WebP válido <=500 KB
  Cuando se carga
  Entonces se almacena privado, se persiste metadata y se responde 201

Escenario: archivo inválido
  Dado MIME, firma, dimensiones o tamaño inválido
  Cuando se procesa
  Entonces se rechaza sin metadata ni archivo permanente

Escenario: fallo transaccional
  Dado que archivo o base de datos falla
  Cuando se compensa
  Entonces no queda una evidencia parcial utilizable
```

## Validaciones

- Funcionales: 500 000 bytes exactos, 500 001 bytes, décima/undécima evidencia y estado finalizado.
- Técnicas: pruebas unitarias, HTTP multipart y PostgreSQL real; rutas no expuestas y `Cache-Control: no-store`.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
