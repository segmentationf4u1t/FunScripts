$base64String = 'aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUQ=='
$decodedBytes = [System.Convert]::FromBase64String($base64String)
$decodedString = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
Start-Process $decodedString
