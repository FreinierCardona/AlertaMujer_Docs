# Frontend — Runbook

> [!NOTE] INSTRUCTIONS
> Los comandos exactos deben verificarse en `package.json` antes de ejecutarlos; los nombres pueden cambiar.

## Objetivo operativo

Arrancar y validar Mobile o Web sin asumir disponibilidad Backend.

## Precondiciones

- Node.js y gestor de paquetes compatibles con el repositorio.
- Dependencias instaladas desde el lockfile.
- Variables locales sin secretos versionados.

## Arranque local

```text
Consultar los scripts vigentes de package.json para Mobile o Web.
```

## Verificación

| Señal | Resultado esperado | Acción si falla |
|---|---|---|
| typecheck/lint | sin errores | corregir antes de PR |
| pruebas | suite aplicable aprobada | conservar salida |
| render Mobile/Web | navegación estable | revisar dependencias y entorno |
| i18n | cuatro idiomas seleccionables | revisar recursos y claves |

## Fallos conocidos

| Síntoma | Diagnóstico | Recuperación |
|---|---|---|
| datos no persisten | flujo usa mocks | no atribuirlo a Backend |
| texto sin traducir | clave ausente | completar los cuatro recursos |

## Escalamiento

Conservar comando, salida, plataforma, versión y captura sin datos sensibles.

## Retorno

Revertir solo el cambio propio mediante Git; no borrar estado de otros desarrolladores.

## Diagnóstico de evidencia y conectividad

- Confirmar permiso de cámara, primer plano y estado de guardado; el temporizador de 10 s no garantiza entrega.
- Si falla la carga, revisar mensaje, sesión, URL y respuesta HTTP sin registrar fotografías ni credenciales. Expo Go usa `File` para el multipart.
- Comprobar metadata PostgreSQL y archivo privado; abrir el contenido como contacto aceptado y administrador autorizado.
- Vigilar capacidad y copias de PostgreSQL y archivos: `max_evidence_count = 0` no impone un límite de cantidad y las fotos ocupan espacio del volumen.
- `OFFLINE` indica falta de latidos confirmados, no prueba por sí solo que el teléfono carezca de internet. Probar red, reanudación y ubicación por separado.

---

**Relacionados:** [`README.md`](README.md) · [`../../13-operations/runbook.md`](../../13-operations/runbook.md)
