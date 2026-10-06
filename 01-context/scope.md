# 01 — Alcance

> [!NOTE] INSTRUCTIONS
> Mantenga incluidos y excluidos verificables. Un cambio de alcance actualiza producto, requisitos, arquitectura y trazabilidad.

## Dentro del alcance

| Área | Capacidades |
|---|---|
| Identidad | Registro, OTP, sesión, recuperación y términos. |
| Perfil | Datos permitidos, mensaje de ayuda, idioma y apariencia. |
| Contactos | Directorio autorizado, invitación, aceptación, rechazo y vigencia. |
| Emergencia | SOS estándar, estados, ubicación, notificación, evidencia, chat y cierre propio. |
| Administración | Login, monitoreo, atención, cuentas, auditoría y reporte básico. |
| Público | Información, seguridad comunicada con honestidad y APK disponible. |
| Persistencia | 16 entidades, roles técnicos, migraciones y rollback. |

## Fuera de alcance

- iOS, audio o video como evidencia, reconocimiento facial o análisis predictivo.
- Microservicios, service mesh, broker, cola offline persistente o transacciones distribuidas.
- Entrega o lectura garantizada de FCM.
- Almacenamiento de evidencia en nube.
- Múltiples administradores funcionales simultáneos.
- Finalización administrativa de emergencias.
- Alta disponibilidad empresarial, RTO/RPO o despliegue productivo sin decisión aprobada.

## Revisión del alcance

Una ampliación requiere: requisito actualizado, impacto por ecosistema, ADR si cambia arquitectura, contrato compatible, estrategia de datos, pruebas y aprobación en la puerta correspondiente.

| Señal | Acción |
|---|---|
| Capacidad no trazada | Estado: Pendiente; no implementar. |
| Código fuera de alcance | Registrar inconsistencia y decidir retirar o formalizar. |
| Dependencia externa nueva | Revisar seguridad, operación y costos antes del ADR. |

---

**Relacionados:** [`./overview.md`](./overview.md) · [`../03-product/problem-framing.md`](../03-product/problem-framing.md)
