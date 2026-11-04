# 01 — Visión General

> [!NOTE] INSTRUCTIONS
> Verifique cada restricción contra requisitos y repositorios. Mantenga el bloque hasta revisión funcional y técnica.

## Qué hace

AlertaMujer permite preparar contactos, activar una emergencia SOS con ubicación, aportar evidencia fotográfica, conversar durante la alerta y consultar historial. Un administrador de entidad puede observar, atender y auditar operaciones autorizadas.

| Capacidad | Resultado |
|---|---|
| Preparación | Cuenta verificada, contacto aceptado, permisos y GPS evaluados. |
| Emergencia | Una alerta abierta trazable con ubicación y estado confirmado. |
| Atención | Consulta administrativa, cambio a `IN_PROGRESS` y chat contextual. |
| Cierre | Solo la propietaria finaliza; el historial queda en lectura. |

## Para quién

| Actor | Necesidad |
|---|---|
| Usuaria `USER` | Solicitar ayuda y mantener control sobre su alerta y datos. |
| Administrador `ENTITY_ADMIN` | Atender y consultar información autorizada sin finalizar por la usuaria. |
| Contacto de emergencia | Aceptar/rechazar relación y consultar alertas abiertas vinculadas. |
| Visitante | Conocer capacidades reales y disponibilidad del APK. |

## Problema que resuelve

Reduce la fricción entre reconocer riesgo, crear una alerta trazable y disponer de contexto para atención. No garantiza conectividad, aviso con la aplicación cerrada ni respuesta institucional. El panel interno requiere que la persona consulte la aplicación; los scripts Database conservan tablas históricas de FCM.

## Restricciones

| Restricción | Consecuencia |
|---|---|
| Tres repositorios independientes | Cambios coordinados mediante contratos, no carpetas compartidas. |
| Integración y despliegue por verificar | El código disponible no acredita operación en un ambiente concreto. |
| Android como cliente móvil | GPS, cámara, permisos y marcador dependen del dispositivo. |
| PostgreSQL + Liquibase | Database es la única fuente de esquema y grants. |
| Evidencia local servidor | No se declara almacenamiento en nube. |

---

**Relacionados:** [`./scope.md`](./scope.md) · [`./glossary.md`](./glossary.md)
