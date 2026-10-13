# HU-API-021 — Retirar FCM y tokens de dispositivo

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Ejecutar coordinada con Mobile y Database; no borrar datos antes de definir la migración.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Backend |
| Módulo | Notification / emergency |
| Objetivo | Eliminar contrato, adaptador, eventos, secretos y dependencia Google exclusivos de push. |
| Alcance | API, servicios, configuración, dependencias, pruebas y documentación ejecutable. |
| Precondiciones | ADR-006; panel interno disponible o despliegue coordinado. |
| Dependencias | HU-AM-029, HU-DB-027. |
| Candidatos | `DeviceTokenController`, notification services/repositorio, listener, FCM adapter, DTOs, `pom.xml`, properties. |
| Resultado | Crear SOS no intenta FCM ni persiste intentos push. |

## Descripción

Retirar `POST /me/device-tokens`, Google OAuth/FCM, `FCM_CREDENTIALS_PATH` y el evento usado solo para push, sin afectar persistencia SOS ni aviso local Android.

## Criterios de aceptación

```gherkin
Escenario: crear emergencia sin FCM
  Cuando se crea una emergencia válida
  Entonces se confirma sin invocar proveedor push ni registrar intento

Escenario: contrato retirado
  Cuando se consulta POST /me/device-tokens
  Entonces la ruta no existe en aplicación ni OpenAPI vigente

Escenario: configuración limpia
  Cuando inicia Backend sin credenciales FCM
  Entonces arranca sin warning ni componente Google asociado
```

## Validaciones

- Funcionales: SOS e idempotencia sin proveedor externo.
- Técnicas: búsqueda limpia de FCM/token, dependencias/configuración retiradas, pruebas y arranque Docker.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-006](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md)
