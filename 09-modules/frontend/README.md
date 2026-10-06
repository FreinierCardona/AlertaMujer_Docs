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
| Salida | solicitudes REST y mensajes STOMP | contrato en refinamiento |

## Dependencias

| Dependencia | Motivo | Tipo |
|---|---|---|
| Backend | capacidades y seguridad | runtime pendiente |
| Expo/React Native | aplicación Mobile | build/runtime |
| React/Vite | aplicación Web | build/runtime |

## Estado

| Aspecto | Estado | Evidencia |
|---|---|---|
| Implementación | Confirmada con estado local/mocks | repositorio oficial |
| Contratos reales | Pendiente | Backend sin implementación |
| Cuatro idiomas | Confirmado | recursos i18n Frontend |

## Criterio de cierre

- Pruebas visuales, funcionales y de accesibilidad pasan.
- Integración real se prueba sin presentar mocks como Backend.

---

**Relacionados:** [`data-model.md`](data-model.md) · [`decisions.md`](decisions.md) · [`runbook.md`](runbook.md)
