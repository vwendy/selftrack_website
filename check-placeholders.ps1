# Lists every unfinished placeholder left in the site. Publish only when this prints nothing.
$hits = Select-String -Path "$PSScriptRoot\*.html" -Pattern '\[\[' 
if ($hits) { $hits | ForEach-Object { "{0}:{1}  {2}" -f $_.Filename, $_.LineNumber, $_.Line.Trim().Substring(0, [Math]::Min(110, $_.Line.Trim().Length)) }; "`n$($hits.Count) placeholder(s) left." } else { "No placeholders left." }

