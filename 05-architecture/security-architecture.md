# 05 — Arquitectura de Seguridad

> [!NOTE] INSTRUCTIONS
> Mantenga separados controles implementados, evidencia local y controles operativos pendientes. No documente secretos ni valores reales.

## Límites de confianza

| Cruce | Control | Estado de evidencia |
|---|---|---|
| Persona → Frontend | Validación de forma y almacenamiento de sesión | Parcial; propiedad Frontend |
| Frontend → Backend | JWT, sesión, rol, propiedad, estado y CORS explícito | Implementado y probado localmente |
| Backend → Database | alertamujer_app y mínimo privilegio | Verificado contra PostgreSQL 17.11 |
| Migrator → Database | Credencial separada, Liquibase y rollback | Propiedad Database |
| Backend → FCM/SMTP/archivos | Secretos por entorno, rutas privadas y resultados técnicos | Código implementado; operación externa pendiente |

## Identidad y sesión

- JWT HS256 incluye sub, role, sid, iss, aud, iat y exp sin PII.
- La sesión es revocable; logout, cambio de contraseña y cambio de correo aplican las revocaciones correspondientes.
- OTP se guarda como hash y se restringe por propósito, canal, contexto, intentos y reenvíos.
- Los errores no revelan existencia de cuenta, hashes, OTP ni credenciales.
- CORS solo permite orígenes configurados y no habilita credenciales cross-site.

## Autorización

| Operación | Controles implementados |
|---|---|
| Recurso propio | Sesión, cuenta, propiedad y estado |
| Emergencia administrativa | ENTITY_ADMIN, sesión vigente y transición permitida |
| Chat/evidencia | Acceso a emergencia y estado compatible |
| Auditoría | Solo administrador; consulta sin edición |
| Database | Grants explícitos y funciones protegidas |

## Datos y archivos

Fotografías usan nombre aleatorio y ruta no pública; PostgreSQL conserva metadatos. Los logs y errores excluyen contraseñas, OTP, refresh token, token FCM, ruta privada, contenido de chat y ubicación precisa innecesaria.

## Evidencia y pendientes

El 2026-10-08, la suite de 126 pruebas aprobó sin fallos ni omisiones sobre PostgreSQL local. Quedan pendientes rotación de secretos, rate limiting general, TLS de ambientes, retención de logs, threat model, pruebas de penetración y validación real de SMTP/FCM.

---

**Relacionados:** [../00-governance/security-policy.md](../00-governance/security-policy.md) · [decisions/README.md](./decisions/README.md) · [../04-requirements/non-functional.md](../04-requirements/non-functional.md)
