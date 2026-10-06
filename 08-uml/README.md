# 08 — UML y diagramas

> [!NOTE] INSTRUCTIONS
> Cada diagrama debe responder una pregunta y enlazar su fuente. No dibuje una implementación no verificada.

## Propósito

Ofrecer vistas compactas del sistema, su interacción crítica, estados y datos sin convertir diagramas en otra fuente de reglas.

## Documentos

| Documento | Vistas | Fuente |
|---|---|---|
| [`diagram-index.md`](diagram-index.md) | contexto, SOS, estados y datos | secciones especializadas |

## Convenciones

| Elemento | Convención |
|---|---|
| Código | Mermaid versionado en Markdown |
| Título | pregunta o vista concreta |
| Estado | confirmado, objetivo o pendiente |
| Flechas | dependencia o mensaje etiquetado |
| Fuente | enlace al documento propietario |

## Lectura

Los diagramas explican relaciones; los documentos relacionados gobiernan definiciones. Si existe diferencia, se corrige el diagrama contra la fuente técnica vigente.

## Fuera de alcance

- Diagramas decorativos.
- Capturas sin fuente editable.
- Clases inferidas de código inexistente.
- Secuencias de integraciones no aprobadas.

## Listo cuando

- Cada vista declara alcance y estado.
- Todos los nodos representan elementos documentados.
- Las relaciones coinciden con contratos y modelos.
- El código Mermaid renderiza sin error.

---

**Relacionados:** [`../05-architecture/README.md`](../05-architecture/README.md) · [`../06-data/README.md`](../06-data/README.md)
