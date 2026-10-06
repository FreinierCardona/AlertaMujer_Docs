[CmdletBinding()]
param(
    [string]$DocsRoot
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
    $DocsRoot = Split-Path -Parent $DocsRoot
}
$root = (Resolve-Path -LiteralPath $DocsRoot).Path
$rootPrefix = $root.TrimEnd('\') + '\'
function Get-DocsRelativePath([string]$Path) {
    if ($Path.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        return $Path.Substring($rootPrefix.Length)
    }
    return $Path
}
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()
$markdown = Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*.md'
$allFiles = Get-ChildItem -LiteralPath $root -Recurse -File
$incoming = @{}

foreach ($file in $markdown) {
    $incoming[$file.FullName.ToLowerInvariant()] = 0
}

foreach ($file in $markdown) {
    $relative = Get-DocsRelativePath $file.FullName
    $lines = Get-Content -LiteralPath $file.FullName
    $content = $lines -join "`n"

    if ($lines.Count -lt 25 -and $file.Name -notin @('CHANGELOG.md', 'CONTRIBUTING.md')) {
        $errors.Add("Documento menor de 25 líneas: $relative ($($lines.Count))")
    }
    if ($file.Name -ne 'README.md' -and $relative -notin @('00-sdd-guide.md', 'CHANGELOG.md', 'CONTRIBUTING.md') -and $lines.Count -gt 80) {
        $errors.Add("Documento mayor de 80 líneas: $relative ($($lines.Count))")
    }

    $isFramework = $relative -match '^(\d{2}-[^\\]+|_stacks)\\' -or $relative -eq '00-sdd-guide.md'
    if ($isFramework) {
        if ($content -notmatch '(?m)^> \[!NOTE\] INSTRUCTIONS$') {
            $errors.Add("Falta bloque INSTRUCTIONS: $relative")
        }
        if ($content -notmatch '(?m)^\*\*Relacionados:\*\*') {
            $errors.Add("Falta pie Relacionados: $relative")
        }
    }

    if ($file.Name -eq 'README.md' -and $relative -match '^(\d{2}-[^\\]+)\\README\.md$') {
        foreach ($heading in @('## Propósito', '## Documentos', '## Fuera de alcance', '## Listo cuando')) {
            if ($content -notmatch "(?m)^$([regex]::Escape($heading))$") {
                $errors.Add("README de sección sin '$heading': $relative")
            }
        }
    }

    foreach ($match in [regex]::Matches($content, '(?m)\[[^\]]+\]\((?<target>[^)]+)\)')) {
        $target = $match.Groups['target'].Value.Trim()
        if ($target -match '^(https?://|mailto:|#|codex:)') { continue }
        $pathPart = ($target -split '#', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathPart)) { continue }
        $decoded = [Uri]::UnescapeDataString($pathPart)
        $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $decoded))
        if (-not (Test-Path -LiteralPath $resolved)) {
            $errors.Add("Enlace roto en ${relative}: $target")
            continue
        }
        if ((Test-Path -LiteralPath $resolved -PathType Container)) {
            $resolved = Join-Path $resolved 'README.md'
        }
        $key = $resolved.ToLowerInvariant()
        if ($incoming.ContainsKey($key) -and $resolved -ne $file.FullName) {
            $incoming[$key]++
        }
    }

    if ($content -match '[ \t]+(?=\r?$)') {
        $errors.Add("Espacio al final de línea: $relative")
    }
}

$textFiles = $allFiles | Where-Object { $_.Extension -in @('.md', '.yaml', '.yml') }
$combined = ($textFiles | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join "`n"
$forbidden = @(
    @{ Pattern = '(?i)\bMVP\b'; Label = 'terminología no permitida' },
    @{ Pattern = '(?i)proyecto (acad[eé]mico|estudiantil|demostrativo)'; Label = 'clasificación no permitida' },
    @{ Pattern = '(?i)ejercicio acad[eé]mico|aplicaci[oó]n de pr[aá]ctica'; Label = 'clasificación no permitida' },
    @{ Pattern = '(?i)RF[- ]?0*7\b|requisito funcional (n[uú]mero )?0*7\b'; Label = 'requisito retirado' },
    @{ Pattern = '(?i)activaci[oó]n discreta'; Label = 'funcionalidad retirada' },
    @{ Pattern = '(?i)monolith-governance-framework'; Label = 'referencia al repositorio modelo' }
)
foreach ($rule in $forbidden) {
    if ($combined -match $rule.Pattern) {
        $errors.Add("Contenido prohibido: $($rule.Label)")
    }
}

foreach ($contract in $allFiles | Where-Object { $_.Extension -in @('.yaml', '.yml') }) {
    $yaml = Get-Content -LiteralPath $contract.FullName -Raw
    $relative = Get-DocsRelativePath $contract.FullName
    foreach ($match in [regex]::Matches($yaml, '\$ref:\s*[''"]?#/components/(?<group>[^/\s''"]+)/(?<name>[^\s''"}]+)')) {
        $name = $match.Groups['name'].Value
        if ($yaml -notmatch "(?m)^\s{4}$([regex]::Escape($name)):\s*") {
            $errors.Add("Referencia OpenAPI no resuelta en ${relative}: $($match.Value)")
        }
    }
}

foreach ($entry in $incoming.GetEnumerator()) {
    $relative = Get-DocsRelativePath $entry.Key
    if ($entry.Value -eq 0 -and $relative -notin @('README.md', 'CHANGELOG.md')) {
        $errors.Add("Documento huérfano: $relative")
    }
}

$rootReadme = Get-Content -LiteralPath (Join-Path $root 'README.md') -Raw
foreach ($section in 0..13 | ForEach-Object { '{0:D2}-' -f $_ }) {
    $directory = Get-ChildItem -LiteralPath $root -Directory | Where-Object { $_.Name.StartsWith($section) }
    if (-not $directory) {
        $errors.Add("Falta sección con prefijo $section")
    } elseif ($rootReadme -notmatch [regex]::Escape("./$($directory.Name)/README.md")) {
        $errors.Add("README raíz no enlaza $($directory.Name)")
    }
}

Write-Host "Documentos Markdown: $($markdown.Count)"
Write-Host "Archivos totales: $($allFiles.Count)"
Write-Host "Advertencias: $($warnings.Count)"
if ($warnings.Count) { $warnings | ForEach-Object { Write-Warning $_ } }

if ($errors.Count) {
    Write-Host "Errores: $($errors.Count)" -ForegroundColor Red
    $errors | Sort-Object -Unique | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host 'Documentation validation passed' -ForegroundColor Green
exit 0
