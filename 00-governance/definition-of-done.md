# 00 — Definition of Done

> [!NOTE] INSTRUCTIONS
> Ajuste umbrales solo mediante decisión documentada. Mantenga el bloque hasta revisión de Frontend, Backend y Database.

## Lista de verificación

- [ ] Se cumplen criterios de aceptación sin ampliar alcance.
- [ ] Pruebas de la capa correspondiente terminan con resultado verificable.
- [ ] Seguridad, privacidad, accesibilidad y localización aplicables fueron revisadas.
- [ ] Contratos y consumidores permanecen compatibles.
- [ ] Migraciones incluyen forward, rollback explícito, grants mínimos y evidencia aislada.
- [ ] La documentación principal y sus enlaces cambiaron en el mismo Pull Request.
- [ ] La matriz enlaza necesidad, requisito, historia, componente, prueba y evidencia.
- [ ] El resultado final incluye commit, ambiente, comando/procedimiento y código de salida.
- [ ] No hay secretos, credenciales, datos personales o evidencia sensible en Git.
- [ ] El cambio fue revisado antes de integrar en la rama acordada.

## Umbrales de cobertura

| Ecosistema | Umbral vigente |
|---|---|
| Frontend | Estado: En refinamiento; typecheck, lint, build y pruebas aplicables son obligatorios cuando existen. |
| Backend | Estado: Pendiente hasta que exista implementación y estrategia ejecutable. |
| Database | Ciclo `test-release.ps1` con código cero y `Release validation passed`. |
| Documentación | Validador sin enlaces rotos, huérfanos ni violaciones estructurales. |

Un proceso largo o una captura parcial no es evidencia de cierre. Una interfaz local no acredita una integración de extremo a extremo.

---

**Relacionados:** [`definition-of-ready.md`](./definition-of-ready.md) · [`../11-quality/testing-strategy.md`](../11-quality/testing-strategy.md)
