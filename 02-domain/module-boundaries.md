# 02 — Límites de Módulos

> [!NOTE] INSTRUCTIONS
> Los límites describen propiedad y contrato; no convierten módulos en servicios desplegables independientes.

## Qué es un módulo aquí

Una capacidad con vocabulario, reglas y dueño claros. Frontend, Backend y Database son ecosistemas independientes; dentro de ellos los módulos se alinean con el mapa funcional sin repetir lógica.

## Cómo dibujar el límite

1. La regla se escribe una vez en su dominio.
2. Un ecosistema ejecuta la regla; los demás consumen su resultado.
3. El cruce usa OpenAPI, WSS/STOMP o una migración versionada.
4. Ningún cliente escribe directamente en PostgreSQL.
5. Database protege estructura; Backend protege autorización y transiciones.

## Mapa de límites

| Módulo | Frontend | Backend objetivo | Database |
|---|---|---|---|
| Identity | formularios, sesión local segura | auth, OTP, JWT, sesión | schema `identity` |
| Contacts | directorio e invitaciones | reglas y concurrencia | schema `contacts` |
| Emergency | SOS y seguimiento | idempotencia y estados | schema `emergency` |
| Notification | permisos y token cliente | adaptador FCM | schema `notification` |
| Evidence | cámara, galería y visor | archivos y autorización | metadata `emergency` |
| Chat | REST + WSS/STOMP | autorización y publicación | mensajes `emergency` |
| Administration | panel protegido | RBAC, atención y auditoría | schema `audit` |
| Experience | idioma, tema y accesibilidad | sin persistencia actual | sin tabla propia |

## Señales de límite incorrecto

- Frontend decide un estado que Backend no confirmó.
- Backend aplica Liquibase o usa rol migrador.
- Database contiene reglas de interfaz o archivos.
- La misma regla aparece con valores distintos en dos módulos.
- Una pantalla nueva obliga a crear tabla sin requisito funcional.

---

**Relacionados:** [`../05-architecture/module-structure.md`](../05-architecture/module-structure.md) · [`../09-modules/module-catalog.md`](../09-modules/module-catalog.md)
