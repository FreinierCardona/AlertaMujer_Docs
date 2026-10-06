# Stacks tecnológicos

> [!NOTE] INSTRUCTIONS
> Estas fichas complementan la arquitectura. Verifique versiones y comandos en los repositorios antes de actualizarlas.

## Propósito

Concentrar convenciones específicas de cada tecnología sin contaminar documentos de dominio o gobernanza.

## Fichas

| Stack | Ecosistema | Estado |
|---|---|---|
| [`java-spring.md`](java-spring.md) | Backend | objetivo, implementación Pendiente |
| [`node-typescript.md`](node-typescript.md) | Frontend Web y herramientas | implementado; versiones en repositorio |
| [`react-native-expo.md`](react-native-expo.md) | Frontend Mobile | implementado; versiones en repositorio |
| [`postgresql-liquibase.md`](postgresql-liquibase.md) | Database | implementado |

## Regla de uso

Una ficha responde cómo aplicar el stack dentro de AlertaMujer. No define requisitos, reglas de negocio ni propiedad entre ecosistemas.

## Actualización

| Cambio | Documentos adicionales |
|---|---|
| versión mayor | compatibilidad, pruebas y ADR si cambia arquitectura |
| librería nueva | módulo consumidor y justificación |
| comando nuevo | runbook del ecosistema |
| retirada | changelog y migración |

## Fuera de alcance

- Tutoriales genéricos.
- Dependencias hipotéticas.
- Versiones copiadas sin verificar.
- Credenciales o configuración sensible.

## Listo cuando

Cada ficha separa baseline, estructura, límites, pruebas y comandos verificables.

---

**Relacionados:** [`../05-architecture/README.md`](../05-architecture/README.md) · [`../09-modules/README.md`](../09-modules/README.md)
