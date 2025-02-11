This “tscon trick” is still known to work in many cases—but there are a few important caveats to keep in mind:

1. **What It Does:**  
   The snippet
   ```powershell
   $ID = (Get-Process -PID $pid).SessionID
   tscon $ID /dest:console
   ```
   obtains the session ID of the current PowerShell process (since `$pid` is an automatic variable representing the current process’s ID) and then uses the `tscon` command to attach that session to the console. This is a commonly used method to “disconnect” a Remote Desktop (RDP) session without fully logging off—allowing applications to continue running.

2. **Privileges:**  
   For the command to succeed, you generally need to run your PowerShell (or command prompt) with administrator privileges. Without elevated rights, `tscon` might fail or not work as expected.

3. **Windows Version & Environment:**  
   - On Windows 10 (and many Windows Server editions), this trick is still effective when used in the proper context (e.g., disconnecting an RDP session).
   - However, behavior can depend on the specific version or update. Some newer versions (or Windows 11 in certain configurations) might have subtle changes in session management or security policies that could affect its operation.
   - Also, if there’s no active “console” session or if the session you’re trying to connect isn’t eligible (for example, if some policies are in place), the command might not work as intended.

4. **Support & Future Changes:**  
   Although `tscon` is still a part of Windows and has been used for years to achieve this effect, it is not an officially documented or supported “feature” for managing RDP sessions. This means that while it works today, future updates or changes in Windows could potentially affect its behavior.

### In Summary

If you run it with the appropriate privileges on a compatible Windows version, the command should still work for its intended purpose. Just be aware of the environment and any policy or update changes that might alter its behavior.

If you run into issues, consider:
- Running your shell as an administrator.
- Verifying that your session is eligible to be attached to the console.
- Checking for any recent changes in your Windows version that might affect RDP or session handling.
