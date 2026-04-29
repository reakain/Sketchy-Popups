@if (@CodeSection == @Batch) @then

@echo off
setlocal

cscript /nologo /e:JScript "%~f0"

goto :EOF

@end // end batch / begin JScript hybrid chimera

// DriveType=4 means CD drive for a WScript FSO object.
// See http://msdn.microsoft.com/en-us/library/ys4ctaz0%28v=vs.84%29.aspx

// NameSpace(17) = ssfDRIVES, or My Computer.
// See http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx

var oSH = new ActiveXObject('Shell.Application'),
    FSO = new ActiveXObject('Scripting.FileSystemObject'),
    CDdriveType = 4,
    ssfDRIVES = 17,
    drives = new Enumerator(FSO.Drives);
var wshShell = WScript.CreateObject("WScript.Shell");

while (!drives.atEnd()) {
    var x = drives.item();
    if (x.DriveType == CDdriveType) {
        oSH.NameSpace(ssfDRIVES).ParseName(x.DriveLetter + ':').InvokeVerb('Eject');
        while (x.IsReady)
            WSH.Sleep(50);
        quit;
    }
    drives.moveNext();
}
var btn = wshShell.Popup("Your system is not compatible with the free cupholder upgrade. Please by a cd-drive to recieve your free cup-holder upgrade.",-1, "Not Cupholder Compatible", 0x0 + 0x10);

//WSH.Sleep(50);
// Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Your system is not compatible with the free cupholder upgrade. Please by a cd-drive to recieve your free cup-holder upgrade.', 'Not Cupholder Compatible', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Warning);



// powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You twust me so much UwU Dawts weawwy weawwy dangewous cause iwt couwda been a viwus UwU UwU UwU', 'Wuh-Oh', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Warning);}"