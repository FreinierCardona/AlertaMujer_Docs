# 00 — Auditoría Documental

> [!NOTE] INSTRUCTIONS
> Actualice esta fotografía solo con evidencia fechada. No la use como reemplazo de las fuentes principales.

## Corte verificado

| Ecosistema | Implementación observada | Diseño sin implementación |
|---|---|---|
| Frontend | Mobile React Native/Expo y Web React/Vite; veinte HU-AM representadas localmente | Integración real con Backend, FCM, WSS y archivos |
| Backend | Scaffold Spring Boot en `develop`: Java 21, Boot 4.1.1, Maven Wrapper, perfiles sin datasource y prueba de contexto | API, seguridad funcional, Database, contenedor y pruebas por vertical |
| Database | 25 HU-DB, 7 schemas, 16 entidades, 62 changesets; HU-DB-025 aplicada | Ningún vacío de aplicación identificado para HU-DB-025 |
| Docs | Secciones `00`–`13`, stacks y plantillas por dominio | Segunda revisión humana de cada documento |

## Inconsistencias reconciliadas

| Antes | Evidencia | Resolución |
|---|---|---|
| Web se describía ausente | `web/` existe en Frontend | Se documenta implementación local sin integración Backend |
| HU-DB-025 figuraba pendiente | Merge y migraciones presentes; usuario confirma aplicación | Se registra aplicada y se retira bloqueo Database |
| Inventario indicaba 60 changesets | Estado actual contiene 62 | Conteo vigente actualizado |
| Idioma confirmaba dos catálogos | Frontend implementa cuatro | RF18 consolida español, inglés, portugués y francés |
| Backend podía leerse como inexistente o implementado | Scaffold real sin capacidades funcionales | Se distingue HU-API-001 integrada de las historias pendientes |
| Modelo histórico tenía 13 entidades | Modelo vigente y Database tienen 16 | Solo el modelo de 16 guía nuevas decisiones |

## Controles ejecutados

- Enlaces relativos, archivos huérfanos, pies `Relacionados`, títulos y estructura de README.
- Referencias OpenAPI, términos retirados, estados pendientes y separación de ecosistemas.
- `git diff --check` y estado limpio de Frontend, Backend y Database antes de modificar Docs.

---

**Relacionados:** [`documentation-rules.md`](./documentation-rules.md) · [`../09-modules/module-catalog.md`](../09-modules/module-catalog.md)
