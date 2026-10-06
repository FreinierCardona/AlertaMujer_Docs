# Stack — React Native y Expo

> [!NOTE] INSTRUCTIONS
> Verifique el SDK y dependencias en el repositorio Frontend. El valor histórico SDK 57 requiere confirmación en el checkout actual.

## Baseline de versión

| Elemento | Versión | Fuente |
|---|---|---|
| Expo SDK | verificar en repositorio | configuración Mobile |
| React Native | dependencia bloqueada | lockfile |
| Expo Router | dependencia bloqueada | `package.json` |

## Distribución

Rutas representan navegación; componentes y hooks encapsulan interacción; contextos coordinan sesión y preferencias; servicios aíslan contratos y mocks.

## Control de límites

- Pantallas no contienen secretos ni acceso Database.
- Permisos de dispositivo se solicitan con explicación funcional.
- Mocks no se presentan como persistencia real.
- Recursos de los cuatro idiomas comparten claves.

## Migraciones

Una actualización de SDK verifica compatibilidad nativa, navegación, permisos, build y pruebas visuales en plataformas soportadas.

## Capas de prueba

| Capa | Alcance |
|---|---|
| estática | tipos y lint |
| componente | estados y accesibilidad |
| integración | navegación, permisos y contexto |
| E2E | acceso y flujo SOS crítico |

## Comandos

Usar scripts Mobile del repositorio. Registrar plataforma, runtime, comando y salida final.

---

**Relacionados:** [`../09-modules/frontend/README.md`](../09-modules/frontend/README.md) · [`../12-ux-ui/mobile.md`](../12-ux-ui/mobile.md)
