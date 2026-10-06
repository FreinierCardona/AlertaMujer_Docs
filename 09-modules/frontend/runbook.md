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

---

**Relacionados:** [`README.md`](README.md) · [`../../13-operations/runbook.md`](../../13-operations/runbook.md)
