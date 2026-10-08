# 10 — DevOps

> [!NOTE] INSTRUCTIONS
> Documente solo ambientes y automatizaciones verificables. No convierta una recomendación en pipeline existente.

## Propósito

Definir preparación local, ambientes y entrega técnica para los tres ecosistemas.

## Documentos

| Documento | Pregunta | Estado |
|---|---|---|
| [local-setup.md](local-setup.md) | ¿Qué necesita cada checkout local? | Confirmado para validación Backend local |
| [environments.md](environments.md) | ¿Qué ambientes existen y cómo se separan? | En refinamiento |
| [ci-cd.md](ci-cd.md) | ¿Qué automatización de entrega está aprobada? | Pendiente de workflow |

## Unidades de entrega

| Ecosistema | Artefacto | Validación vigente |
|---|---|---|
| Frontend | Mobile y Web | Scripts del repositorio |
| Backend | Jar Spring Boot e imagen Compose | Suite Maven e integración PostgreSQL; 126 pruebas aprobadas el 2026-10-08 |
| Database | Changelog y SQL | scripts/test-release.ps1 |

## Fuera de alcance

- Crear CI/CD desde documentación.
- Compartir secretos o archivos de ambiente.
- Unificar releases independientes sin decisión.
- Reemplazar runbooks de cada ecosistema.

## Listo cuando

- Ambientes, responsables y promociones están aprobados.
- Cada repositorio tiene gates verificables.
- Despliegue y rollback se prueban.
- Configuración sensible queda fuera de Git.

---

**Relacionados:** [../00-governance/git-conventions.md](../00-governance/git-conventions.md) · [../13-operations/README.md](../13-operations/README.md)
