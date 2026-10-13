# 04 — Requisitos Funcionales

> [!NOTE] INSTRUCTIONS
> Los identificadores son estables. No renumere requisitos; actualice historias, contratos y trazabilidad cuando cambie su alcance.

## Secuencia vigente

Los requisitos funcionales activos se renumeran de forma continua de RF1 a RF18. La capacidad antes identificada como RF8 pasa a RF7; las posteriores disminuyen una posición. Esta versión reemplaza las referencias anteriores.

## Requisitos

| Id | Capacidad | Actor | Resultado verificable | Trazabilidad Backend |
|---|---|---|---|---|
| RF1 | Identidad y acceso | Usuaria / administrador | Registro, verificación, sesión, recuperación y gestión de acceso controlados. | HU-API-007 a 010 |
| RF2 | Contactos | Usuaria | Invitar, aceptar, rechazar y consultar relaciones válidas. | HU-API-011 |
| RF3 | Mensaje de ayuda | Usuaria | Configurar texto y copiarlo al crear una emergencia. | HU-API-010 y 012 |
| RF4 | Ubicación | Usuaria | Capturar y compartir coordenadas confirmadas durante una alerta. | HU-API-012 y 013 |
| RF5 | SOS | Usuaria | Crear una única emergencia abierta y seguir su estado. | HU-API-012, 013 y 018 |
| RF6 | Marcador | Usuaria | Abrir el marcador Android sin llamada automática. | No aplica: cliente Android |
| RF7 | Evidencia | Usuaria / contacto autorizado / administrador | Capturar, convertir antes de transferir y consultar fotografías WebP autorizadas de hasta 10 MB. | HU-API-015, 018, 020 y 022 |
| RF8 | Historial | Usuaria | Consultar emergencias finalizadas y datos asociados. | HU-API-013 |
| RF9 | Notificaciones internas | Contacto | Consultar desde Home las alertas abiertas vinculadas, con campana, indicador, listado y detalle seguro. | HU-API-022; sustituye HU-API-014 cuando se implemente HU-API-021 |
| RF10 | Acceso administrativo | Administrador | Autenticarse y acceder solo con rol vigente. | HU-API-009 y 017 |
| RF11 | Gestión de usuarias | Administrador | Consultar y ejecutar cambios autorizados sobre cuentas. | HU-API-007, 010 y 017 |
| RF12 | Monitoreo y atención | Administrador | Listar alertas, ver detalle e iniciar atención. | HU-API-013 y 017 |
| RF13 | Auditoría y reporte | Administrador | Consultar eventos y resúmenes sin editarlos. | HU-API-017 |
| RF14 | Web pública y APK | Visitante | Conocer capacidades y disponibilidad real del artefacto. | No aplica: Frontend |
| RF15 | Chat | Usuaria / administrador | Intercambiar mensajes dentro de una emergencia autorizada. | HU-API-016 |
| RF16 | Perfil | Usuaria | Consultar y editar campos permitidos. | HU-API-010 |
| RF17 | Idioma | Todos | Usar español, inglés, portugués o francés sin perder contexto. | No aplica: Frontend |
| RF18 | Apariencia | Todos | Usar modo claro u oscuro con jerarquía legible. | No aplica: Frontend |

## Interpretación de estado

Un requisito define alcance, no prueba por sí mismo que cada cliente esté operativo. El código vigente aún contiene FCM y el límite final de 1 MB; ADR-006/007 y las HU nuevas describen su sustitución pendiente. La implementación verificable se registra en los catálogos por ecosistema; SMTP, CORS de otro ambiente, APK/dispositivo y despliegue requieren evidencia propia.

---

**Relacionados:** [user-stories.md](./user-stories.md) · [backend-stories.md](./backend-stories.md) · [change-package-evidence-internal-notifications.md](./change-package-evidence-internal-notifications.md) · [traceability-matrix.md](./traceability-matrix.md)
