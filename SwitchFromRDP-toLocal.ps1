$ID = (Get-Process -PID $pid).SessionID
tscon $ID /dest:console
