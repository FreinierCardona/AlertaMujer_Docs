# Stacks tecnológicos

> [!NOTE] INSTRUCTIONS
> Estas fichas complementan la arquitectura. Verifique versiones y comandos en los repositorios antes de actualizarlas.

## Propósito

Concentrar convenciones específicas de cada tecnología sin contaminar documentos de dominio o gobernanza.

## Fichas

| Stack | Ecosistema | Estado |
|---|---|---|
| [java-spring.md](java-spring.md) | Backend | Implementado y verificado localmente |
| [node-typescript.md](node-typescript.md) | Frontend Web y herramientas | Implementado; versiones en repositorio |
| [react-native-expo.md](react-native-expo.md) | Frontend Mobile | Implementado; versiones en repositorio |
| [postgresql-liquibase.md](postgresql-liquibase.md) | Database | Implementado |

## Regla de uso

Una ficha responde cómo aplicar el stack dentro de AlertaMujer. No define requisitos, reglas de negocio ni propiedad entre ecosistemas.

## Actualización

| Cambio | Documentos adicionales |
|---|---|
| Versión mayor | Compatibilidad, pruebas y ADR si cambia arquitectura |
| Librería nueva | Módulo consumidor y justificación |
| Comando nuevo | Runbook del ecosistema |
| Retirada | Changelog y migración |

## Fuera de alcance

- Tutoriales genéricos.
- Dependencias hipotéticas.
- Versiones copiadas sin verificar.
- Credenciales o configuración sensible.

---

**Relacionados:** [../05-architecture/README.md](../05-architecture/README.md) · [../09-modules/README.md](../09-modules/README.md)
