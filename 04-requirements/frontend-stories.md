# 04 — Historias Frontend

> [!NOTE] INSTRUCTIONS
> El estado “representada localmente” no acredita Backend, FCM, WSS o persistencia remota.

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

## Estado de implementación

Las veinte historias tienen representación local en Frontend. Ninguna que dependa de servidor puede declararse integrada de extremo a extremo mientras Backend no exista.

---

**Relacionados:** [`./user-stories.md`](./user-stories.md) · [`../09-modules/frontend/README.md`](../09-modules/frontend/README.md)
