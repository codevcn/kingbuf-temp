<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <%@ include file="../../partials/head-libs.jsp" %>
        <base href="${pageContext.request.contextPath}/">

        <link rel="stylesheet" href="public/admin/all-tables/all-tables-page.css" />
        <title>KingBuf - Nhà hàng của mọi nhà</title>
    </head>

    <body>
        <!-- Header -->
        <%@ include file="../../partials/page-header.jsp" %>

        <!-- Main -->
        <%@ include file="../../admin/all-tables/main.jsp" %>

        <!-- Footer -->
        <%@ include file="../../partials/page-footer.jsp" %>

        <%@ include file="../../partials/script-libs.jsp" %>
        <script src="public/admin/all-tables/all-tables-page.js" defer></script>
    </body>

</html>
