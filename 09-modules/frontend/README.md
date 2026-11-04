# Frontend

> [!NOTE] INSTRUCTIONS
> Actualice esta ficha contra el repositorio Frontend. Diferencie Mobile, Web y servicios simulados.

## Propósito

Entregar la experiencia Mobile para usuarias y la experiencia Web para operación autorizada.

## Responsabilidades

- Navegación, interacción, accesibilidad y validación de interfaz.
- Localización en español, inglés, portugués y francés.
- Captura de intención SOS, ubicación, evidencias y chat según contratos.

## Fuera de alcance

- Reglas de autorización y transacciones Backend.
- Estructura PostgreSQL y migraciones Liquibase.
- Confirmar entrega de notificaciones del proveedor.

## Entradas y salidas

| Dirección | Elemento | Contrato o fuente |
|---|---|---|
| Entrada | respuestas y eventos Backend | [`../../07-api/README.md`](../../07-api/README.md) |
| Salida | solicitudes REST y mensajes STOMP | clientes en `mobile/src/core/api` y `web/src/shared/api`; su existencia no prueba conectividad en ejecución |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| Backend | capacidades y seguridad | clientes implementados; validación integrada depende del ambiente |
| Expo/React Native | aplicación Mobile | build/runtime |
| React/Vite | aplicación Web | build/runtime |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| Implementación | Código de pantallas y clientes presente | repositorio Frontend |
| Contratos reales | Integración en código; ejecución integrada no comprobada en esta revisión | `mobile/src/core/api` y `web/src/shared/api` |
| Cuatro idiomas | Confirmado | recursos i18n Frontend |

## Organización técnica observada

- Mobile: `mobile/app/` declara rutas Expo Router; `mobile/src/modules/` contiene presentación y lógica por dominio; `mobile/src/core/api/` concentra clientes de identidad, contactos, alertas, emergencias, evidencia y chat. `identityApi.ts` consume también `/api/v2/registration-requests` con `X-Registration-Proof`.
- Web: `web/src/app/Router.tsx` resuelve rutas públicas y de administración mediante `navigation.tsx`; `web/src/modules/` contiene `Dashboard`, `AlertsList`, `AlertDetail`, `UsersList`, `UserDetail`, `CreateUserForm` y `AuditPage`. `web/src/shared/api/` concentra los clientes.
- `mobile/package.json` declara Expo 58, React Native y Expo Router; `web/package.json` declara React 19 y Vite 8. Las versiones exactas son las de cada manifiesto.
- Mobile lee `EXPO_PUBLIC_API_BASE_URL` y `EXPO_PUBLIC_AUTHORITY_PHONE`; deriva `/ws` de la primera. Web lee `VITE_API_BASE_URL`, `VITE_WS_BASE_URL` y `VITE_API_TIMEOUT_MS`. No se incluyen valores privados.

## Criterio de cierre

- Pruebas visuales, funcionales y de accesibilidad pasan.
- Integración real se prueba sin presentar mocks como Backend.

## Alerta y evidencia — corte 2026-11-04

Mobile envía latidos en primer plano cada 60 s y al reanudar, sin exigir GPS nuevo; la tarea de ubicación puede aportar posiciones. La captura automática intenta una fotografía cada 10 s solo con pantalla y aplicación activas, cámara lista y permiso concedido. La carga usa `File` de Expo y confirma guardado solo tras respuesta del servidor; no existe cola persistente de fotografías.

El 2026-11-03 se comprobó localmente con Expo Go la captura y consulta por contacto y administrador. El APK, la continuidad en segundo plano y las condiciones de red reales requieren pruebas propias.

---

**Relacionados:** [`data-model.md`](data-model.md) · [`decisions.md`](decisions.md) · [`runbook.md`](runbook.md)
