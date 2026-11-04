# HU-API-020 — Aceptar evidencia WebP hasta 500 KB

> [!NOTE] INSTRUCTIONS
> Estado observado: Código de límite WebP presente en `LocalEvidenceStorage`; la validación integral y la aplicación de HU-DB-026 al ambiente siguen pendientes.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Backend |
| Módulo | Evidence |
| Objetivo | Unificar validación y persistencia de WebP final hasta 500 000 bytes. |
| Alcance | Multipart, MIME y estructura RIFF/WebP, tamaño, almacenamiento, compensación y DTO. |
| Precondiciones | Alerta propia abierta, incluida `OFFLINE`; directorio privado escribible; límite de cantidad solo si la configuración es positiva. |
| Dependencias | ADR-007, HU-DB-026, HU-AM-028. |
| Candidatos | `EvidenceController`, `EvidenceService`, `LocalEvidenceStorage`, properties y pruebas. |
| Resultado | La carga confirmada no supera 500 KB; se compensa un fallo de persistencia y se reconcilian archivos huérfanos. |

## Descripción

Aceptar WebP del cliente y validar MIME, tamaño y estructura RIFF/WebP antes de persistir metadata. `LocalEvidenceStorage` no decodifica píxeles, no valida dimensiones ni recodifica la imagen.

## Criterios de aceptación

```gherkin
Escenario: evidencia válida
  Dado alerta propia abierta y WebP válido <=500 KB
  Cuando se carga
  Entonces se almacena privado, se persiste metadata y se responde 201

Escenario: archivo inválido
  Dado MIME, estructura RIFF/WebP o tamaño inválido
  Cuando se procesa
  Entonces se rechaza sin metadata ni archivo permanente

Escenario: fallo transaccional
  Dado que archivo o base de datos falla
  Cuando se compensa
  Entonces se intenta compensar el archivo; la reconciliación posterior atiende huérfanos
```

## Validaciones

- Funcionales: 500 000 bytes exactos, 500 001 bytes, undécima evidencia con límite cero, OFFLINE y estado finalizado.
- Técnicas: pruebas unitarias, HTTP multipart y PostgreSQL real; rutas no expuestas y `Cache-Control: no-store`.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
