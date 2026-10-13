# 04 — Historias Frontend

> [!NOTE] INSTRUCTIONS
> Un merge o una validación estática no acredita dispositivo físico ni recorrido integrado. Las HU-AM-028 a 031 son propuestas nuevas y se detallan en el paquete de cambio.

## Catálogo HU-AM

| Id | Resultado | Cliente | RF | Dependencia principal |
|---|---|---|---|---|
| HU-AM-001 | Acceso, registro y verificación | Mobile | RF1 | contratos Identity |
| HU-AM-002 | Recuperación de contraseña | Mobile | RF1 | OTP y sesión |
| HU-AM-003 | Contactos de emergencia | Mobile | RF2, RF9 | Contacts / Notification |
| HU-AM-004 | Perfil y mensaje de ayuda | Mobile | RF3, RF16 | Profile |
| HU-AM-005 | Cuatro idiomas y apariencia | Mobile / Web | RF17, RF18 | catálogos i18n y tokens |
| HU-AM-006 | Preparación SOS, permisos y GPS | Mobile | RF4, RF5 | dispositivo y Contacts |
| HU-AM-007 | Activación SOS estándar | Mobile | RF5 | Emergency API |
| HU-AM-008 | Seguimiento, ubicación y aviso persistente | Mobile | RF4, RF5, RF9 | Emergency / Location |
| HU-AM-009 | Evidencia fotográfica | Mobile | RF7 | Evidence API |
| HU-AM-010 | Chat y marcador | Mobile | RF6, RF15 | WSS/STOMP |
| HU-AM-011 | Finalización propia e historial | Mobile | RF5, RF8 | Emergency / History |
| HU-AM-012 | Navegación bloqueada por alerta abierta | Mobile | RF5 | sesión y estado local |
| HU-AM-013 | Sitio público y APK | Web | RF14 | publicación de artefacto |
| HU-AM-014 | Login administrativo | Web | RF10 | JWT/RBAC |
| HU-AM-015 | Shell y preferencias del panel | Web | RF17, RF18 | guardas y preferencias |
| HU-AM-016 | Dashboard y monitoreo | Web | RF12 | Administration API |
| HU-AM-017 | Detalle, mapa y atención | Web | RF12 | Emergency / Maps |
| HU-AM-018 | Evidencias y chat administrativos | Web | RF7, RF15 | Evidence / Chat |
| HU-AM-019 | Consulta y gestión de usuarias | Web | RF11 | Administration / Identity |
| HU-AM-020 | Reporte básico y auditoría visual | Web | RF13 | Audit API |
| HU-AM-021 | Integración de identidad, sesión y cuenta propia | Mobile | RF1, RF3, RF16 | Identity API |
| HU-AM-022 | Integración de contactos y preparación SOS | Mobile | RF2, RF5 | Contacts API |
| HU-AM-023 | Integración de emergencia, ubicación e historial | Mobile | RF4, RF5, RF8 | Emergency API |
| HU-AM-024 | Integración de evidencia y chat | Mobile / Web | RF7, RF15 | Evidence / WSS |
| HU-AM-025 | Sesión y shell administrativo protegido | Web | RF10, RF17, RF18 | Auth / RBAC |
| HU-AM-026 | Monitoreo y atención administrativa | Web | RF12 | Administration / Emergency |
| HU-AM-027 | Gestión de usuarias y auditoría | Web | RF11, RF13 | Administration / Audit |
| HU-AM-028 | Captura y carga WebP de hasta 10 MB | Mobile | RF7 | ADR-007, API-020 |
| HU-AM-029 | Retiro de push remoto | Mobile | RF5, RF9 | ADR-006, API-021 |
| HU-AM-030 | Campana, indicador y listado vinculado | Mobile | RF9 | ADR-006, API-022 |
| HU-AM-031 | Detalle y evidencia para contacto | Mobile | RF7, RF9 | ADR-006/007, API-022 |

## Estado de implementación

HU-AM-001 a 027 tienen código integrado en `develop`. El 2026-10-13, Mobile y Web aprobaron typecheck/lint y Web aprobó build; la suite Playwright aprobó 3 de 10 casos y falló en siete casos asociados a login/mocks desactualizados. No hubo prueba de cámara, conversión, ubicación en segundo plano, APK o dispositivo físico. HU-AM-028 a 031 permanecen propuestas.

---

**Relacionados:** [change-package-evidence-internal-notifications.md](./change-package-evidence-internal-notifications.md) · [`./user-stories.md`](./user-stories.md) · [`../09-modules/frontend/README.md`](../09-modules/frontend/README.md)
