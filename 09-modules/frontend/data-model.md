# Frontend — Modelo de datos

> [!NOTE] INSTRUCTIONS
> El estado de interfaz no sustituye el modelo de negocio persistente. Documente persistencia local solo si está verificada.

## Propiedad

Frontend posee estado efímero de presentación y preferencias de interfaz. Consume datos funcionales mediante contratos Backend.

## Estado principal

| Estado | Propósito | Fuente |
|---|---|---|
| sesión visible | habilitar navegación autenticada | contexto Frontend |
| preferencias | tema, idioma y presentación | contexto Frontend |
| formularios | captura y validación inmediata | pantallas |
| SOS visible | representar progreso del flujo | mocks/contrato objetivo |

## Relaciones

```mermaid
flowchart LR
  UI[Pantalla] --> CTX[Estado Frontend]
  CTX --> API[Cliente de contrato]
  API -.-> BE[Backend pendiente]
```

## Reglas de integridad

- No declarar éxito remoto antes de una confirmación contractual.
- Mantener separados datos simulados y respuestas reales.
- No guardar secretos en almacenamiento del cliente.

## Datos sensibles

| Dato | Riesgo | Control |
|---|---|---|
| token de sesión | suplantación | estrategia segura Pendiente con Backend |
| ubicación | exposición | solicitar y transmitir según autorización |
| evidencia | filtración | no publicar localizadores públicos |

## Pendientes

- Estrategia definitiva de almacenamiento seguro de credenciales.
- Política de caché y limpieza al cerrar sesión.

---

**Relacionados:** [`README.md`](README.md) · [`../../06-data/models.md`](../../06-data/models.md)
