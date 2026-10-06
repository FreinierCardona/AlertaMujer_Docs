# 05 — Arquitectura de Seguridad

> [!NOTE] INSTRUCTIONS
> Mantenga separados controles definidos, implementados y pendientes. No documente secretos ni valores reales.

## Límites de confianza

| Cruce | Control requerido | Estado |
|---|---|---|
| Persona → Frontend | validación de forma, almacenamiento seguro de sesión | parcial local |
| Frontend → Backend | TLS, JWT, sesión, rol, propiedad y estado | diseño; Backend pendiente |
| Backend → Database | rol `alertamujer_app`, mínimo privilegio | Database implementado |
| Migrator → Database | credencial separada, Liquibase y rollback | implementado |
| Backend → FCM/archivos | secretos por entorno y rutas privadas | diseño |

## Identidad y sesión

- JWT HS256 con `sub`, `role`, `sid`, `iss`, `aud`, `iat`, `exp` y sin PII.
- Sesión revocable; logout, cambio de contraseña y cambio de correo revocan según regla.
- OTP se guarda como hash y se limita por propósito, canal, contexto, intentos y reenvíos.
- Errores no revelan existencia de cuenta ni credenciales.

## Autorización

| Operación | Controles |
|---|---|
| Recurso propio | sesión + cuenta + propiedad + estado |
| Emergencia administrativa | `ENTITY_ADMIN` + sesión corta + acción permitida |
| Chat/evidencia | acceso a la emergencia + estado compatible |
| Auditoría | solo administrador; consulta sin edición |
| Database | grants explícitos y funciones protegidas |

## Datos y archivos

Fotografías usan nombre aleatorio y ruta no pública; PostgreSQL conserva metadata y hash. Logs excluyen token, OTP, contraseña, ruta privada y ubicación completa innecesaria.

## Pendientes

Rotación de secretos, rate limiting general, TLS de ambientes, retención de logs, threat model y pruebas de penetración permanecen `Pendiente`.

---

**Relacionados:** [`../00-governance/security-policy.md`](../00-governance/security-policy.md) · [`decisions/README.md`](./decisions/README.md)
