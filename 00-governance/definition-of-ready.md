# 00 — Definition of Ready

> [!NOTE] INSTRUCTIONS
> Esta lista aplica a historias de cualquier ecosistema. Mantenga el bloque hasta que producto y responsables técnicos la revisen.

## Lista de verificación

- [ ] La necesidad y el actor están identificados.
- [ ] Existe un requisito, incidencia o decisión que justifica el cambio.
- [ ] El ecosistema responsable y los repositorios afectados están declarados.
- [ ] Alcance y fuera de alcance son explícitos.
- [ ] Los criterios de aceptación son observables y no describen implementación accidental.
- [ ] Las reglas de negocio y datos afectados están enlazados.
- [ ] Los contratos REST/WSS o cambios Database necesarios ya existen o están marcados `Pendiente`.
- [ ] Dependencias, riesgos de seguridad y compatibilidad están identificados.
- [ ] Existe estrategia de prueba y evidencia esperada.
- [ ] Rollback o reversión están definidos cuando el cambio puede alterar datos o contratos.
- [ ] No se necesita inventar una regla durante la implementación.

## Lo que “Ready” no significa

| Situación | Por qué no está lista |
|---|---|
| “Se entiende en la reunión” | La decisión no es trazable ni revisable. |
| UI diseñada sin contrato | La pantalla no define autorización, persistencia ni respuesta real. |
| Migración sin HU/modelo | Database no puede inferir reglas funcionales. |
| Contrato sin responsable | Nadie responde por compatibilidad o evidencia. |
| Dependencia marcada “después” | El criterio de aceptación no puede demostrarse. |

---

**Relacionados:** [`definition-of-done.md`](./definition-of-done.md) · [`../04-requirements/_template-hu.md`](../04-requirements/_template-hu.md)
