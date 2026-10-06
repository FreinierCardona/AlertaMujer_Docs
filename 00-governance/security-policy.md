# 00 — Política de Seguridad

> [!NOTE] INSTRUCTIONS
> Los controles confirmados se distinguen de los pendientes. Mantenga el bloque hasta asignar propietarios operativos.

## Gestión de secretos

| Regla | Responsable | Estado |
|---|---|---|
| Secretos fuera de Git y documentación | Cada ecosistema | Vigente |
| JWT, Database, FCM y Maps por entorno | Operación / Backend | Pendiente de implementación |
| Rotación y respuesta a compromiso | Seguridad / Operación | Pendiente |
| Logs sin contraseñas, OTP, tokens o PII innecesaria | Backend / Operación | Vigente como diseño |

## Dependencias

- Lockfiles se versionan y las actualizaciones se revisan como cambios de código.
- No existe política automatizada de escaneo confirmada.
- Estado: Pendiente para frecuencia, severidades aceptadas, SLA de corrección y excepciones.

## Autenticación y autorización

- Roles funcionales: `USER` y `ENTITY_ADMIN`.
- JWT HS256 con sesión revocable; cada operación valida sesión, cuenta, rol, propiedad y estado.
- Roles PostgreSQL: owner, migrator y aplicación; Backend usa solo `alertamujer_app`.
- Hashes y secretos de autenticación se consultan mediante funciones protegidas cuando corresponde.
- Frontend nunca sustituye autorización Backend ocultando elementos.

## Respuesta a incidentes

1. Contener y preservar evidencia sin datos sensibles.
2. Identificar ecosistema, impacto y versión.
3. Ejecutar el runbook y registrar `INC-NNN`.
4. Validar recuperación y documentar causa y acciones.

Estado: Pendiente para responsable de seguridad, canal de reporte, severidades y tiempos de atención.

---

**Relacionados:** [`../13-operations/_template-incident.md`](../13-operations/_template-incident.md) · [`documentation-rules.md`](./documentation-rules.md)
