param(
    [int]$port = 3000
)

$root = $PSScriptRoot

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Prefixes.Add("http://127.0.0.1:$port/")
$listener.Start()

Write-Host ""
Write-Host "  ========================================" -ForegroundColor DarkGray
Write-Host "   ONE MORE REP - Local Server" -ForegroundColor Red
Write-Host "  ========================================" -ForegroundColor DarkGray
Write-Host ""
Write-Host "   Serving:  " -NoNewline; Write-Host "$root" -ForegroundColor Yellow
Write-Host "   URL:      " -NoNewline; Write-Host "http://localhost:$port" -ForegroundColor Green
Write-Host ""
Write-Host "   Press Ctrl+C to stop the server" -ForegroundColor DarkGray
Write-Host "  ========================================" -ForegroundColor DarkGray
Write-Host ""

$mimeTypes = @{
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".webp" = "image/webp"
    ".woff" = "font/woff"
    ".woff2"= "font/woff2"
    ".ttf"  = "font/ttf"
    ".mp4"  = "video/mp4"
}

try {
    while ($listener.IsListening) {
        try {
            $context = $listener.GetContext()
            $request = $context.Request
            $response = $context.Response

            $localPath = $request.Url.LocalPath
            if ($localPath -eq "/") { $localPath = "/index.html" }

            $filePath = Join-Path $root ($localPath.TrimStart("/").Replace("/", "\"))

            if (Test-Path $filePath -PathType Leaf) {
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                $contentType = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }

                $response.ContentType = $contentType
                $response.StatusCode = 200

                $fileBytes = [System.IO.File]::ReadAllBytes($filePath)
                $response.ContentLength64 = $fileBytes.Length
                if ($request.HttpMethod -ne "HEAD") {
                    $response.OutputStream.Write($fileBytes, 0, $fileBytes.Length)
                }

                Write-Host "  200 " -NoNewline -ForegroundColor Green
                Write-Host "$($request.HttpMethod) $localPath"
            } else {
                $response.StatusCode = 404
                $msg = [System.Text.Encoding]::UTF8.GetBytes("404 - Not Found")
                $response.ContentLength64 = $msg.Length
                if ($request.HttpMethod -ne "HEAD") {
                    $response.OutputStream.Write($msg, 0, $msg.Length)
                }

                Write-Host "  404 " -NoNewline -ForegroundColor Red
                Write-Host "$($request.HttpMethod) $localPath"
            }

            $response.Close()
        } catch {
            Write-Host "  Error processing request: $_" -ForegroundColor DarkYellow
        }
    }
} finally {
    $listener.Stop()
    Write-Host "`n  Server stopped." -ForegroundColor Yellow
}
