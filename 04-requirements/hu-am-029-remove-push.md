# HU-AM-029 — Retirar notificaciones push de Mobile

> [!NOTE] INSTRUCTIONS
> Historia Propuesta. Distinguir push remoto del aviso local foreground requerido por ubicación Android.

## Identificación

| Campo | Valor |
|---|---|
| Ecosistema | Frontend Mobile |
| Módulo | Configuración / requisitos del dispositivo |
| Objetivo | Eliminar registro de token, bandera y bloqueo SOS asociados a FCM. |
| Alcance | Código, configuración Expo, variables, textos y pruebas Mobile. |
| Precondiciones | ADR-006 aceptado; mecanismo foreground confirmado. |
| Dependencias | ADR-006, HU-API-021. |
| Candidatos | `package.json`, config Expo, `AppStateProvider.tsx`, `appConfig.ts`, `deviceRequirements.ts`, `deviceTokenApi.ts`. |
| Resultado | SOS no depende de permiso ni token push remoto. |

## Descripción

Retirar `expo-notifications` cuando solo soporte push remoto, registro de token, `EXPO_PUBLIC_ENABLE_REMOTE_PUSH`, conflictos FCM y sus llamadas, preservando únicamente el aviso técnico local de seguimiento.

## Criterios de aceptación

```gherkin
Escenario: preparar SOS sin push
  Dado que ubicación, GPS, red y contacto válido están disponibles
  Cuando se evalúa la preparación
  Entonces la ausencia de permiso o token FCM no bloquea SOS

Escenario: sesión sin registro de token
  Cuando la usuaria inicia sesión o recupera foco
  Entonces no se invoca POST /me/device-tokens ni se muestra conflicto FCM

Escenario: seguimiento Android
  Dado que una alerta está abierta
  Cuando la app pasa a segundo plano
  Entonces conserva el aviso local necesario sin usar FCM
```

## Validaciones

- Funcionales: SOS sin push y continuidad del seguimiento foreground.
- Técnicas: dependencia, imports, variables y llamadas retiradas; typecheck, lint y build/dispositivo.

---

**Relacionados:** [paquete](./change-package-evidence-internal-notifications.md) · [ADR-006](../05-architecture/decisions/records/ADR-006-retire-push-notifications.md)
