<%@ Page Language="C#" %>
<script runat="server">
    void Page_Load(Object sender, EventArgs e) {
        // الحصول على اسم المستخدم من خلال البيئة
        string currentUser = Environment.UserName;
        
        // عرض اسم المستخدم على الصفحة
        Response.Write("Current User: " + currentUser);
    }
</script>
