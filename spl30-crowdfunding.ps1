$nowstr = (Get-Date).ToString("yyyyMMdd'T'HHmmss")
$output = Join-Path "data" ($nowstr + ".txt")
echo $nowstr > $output

$html = Invoke-WebRequest "https://motion-gallery.net/projects/spl-ohl"
$cols = $html.ParsedHtml.getElementById("project-ticket").getElementsByClassName("collectors")
$cols |% { if ($_.innerText -match "\d+") { [int]$Matches[0] }} >> $output
