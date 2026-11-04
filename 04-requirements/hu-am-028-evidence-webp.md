# HU-AM-028 — Corregir captura y carga de evidencia WebP

> [!NOTE] INSTRUCTIONS
> Estado observado: conversión, captura automática y carga presentes en `develop`; el recorrido local con Expo Go se comprobó el 2026-11-03. Persisten pruebas de APK y segundo plano.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Frontend Mobile |
| Módulo | Evidencias / configuración nativa |
| Objetivo | Producir y cargar WebP de máximo 500 KB (500 000 bytes) sin fallos silenciosos. |
| Alcance | Cámara, permiso, revisión, conversión, multipart y reintento manual. |
| Precondiciones | Sesión válida; alerta propia abierta; contrato Backend disponible. |
| Dependencias | ADR-007, HU-API-020, HU-DB-026, RF7. |
| Candidatos | `mobile/app.json`, `package.json`, `CaptureEvidenceScreen.tsx`, `evidenceApi.ts`, `ApiClient.ts`. |
| Resultado | Solo se confirma una evidencia después de respuesta `201`. |

## Descripción

Restaurar la configuración Expo en Mobile, solicitar cámara de forma recuperable, convertir la captura a `image/webp`, validar 500 000 bytes y distinguir permiso, conversión, tamaño, red, timeout y servidor.

## Criterios de aceptación

```gherkin
Escenario: captura y envío válidos
  Dado que existe alerta propia abierta y permiso de cámara
  Cuando la conversión produce WebP de hasta 500 KB
  Entonces Mobile envía multipart image/webp y confirma solo tras 201

Escenario: permiso o tamaño inválido
  Dado que falta permiso o el WebP supera 500 KB
  Cuando se intenta adjuntar
  Entonces no se envía y se ofrece recuperación sin alterar la alerta

Escenario: carga fallida
  Dado un temporal WebP válido
  Cuando falla la red o vence el timeout específico
  Entonces no aparece sincronizado y puede reintentarse o descartarse
```

## Validaciones

- Funcionales: permiso concedido/denegado, límite, offline y reintento en Android real.
- Técnicas: config Expo desde Mobile, MIME/firma WebP, tamaño, multipart sin header manual, timeout de archivo, typecheck/lint.

## Ampliación observada en develop

`AutomaticEvidenceCapture` intenta capturas cada 10 s con cámara lista y app activa, y se pausa en segundo plano. La carga multipart usa `expo-file-system` `File`; confirma únicamente tras respuesta del servidor. La prueba local del 2026-11-03 confirmó consulta por contacto y administrador, sin acreditar captura con la app cerrada ni APK.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-007](../05-architecture/decisions/records/ADR-007-webp-evidence-up-to-10mb.md)
