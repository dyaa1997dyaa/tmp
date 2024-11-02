<%@ Page Language="C#" %>
<script runat="server">
    void Page_Load(Object sender, EventArgs e) {
        // الحصول على اسم المستخدم من سياق طلب الويب
        string currentUser = HttpContext.Current.User.Identity.Name;

        // إذا كان المستخدم غير معروف أو لم يتم تعيينه، يتم عرض رسالة توضيحية
        if (string.IsNullOrEmpty(currentUser)) {
            currentUser = "User not authenticated or running under an anonymous context.";
        }

        // عرض اسم المستخدم على الصفحة
        Response.Write("Current User: " + currentUser);
    }
</script>
