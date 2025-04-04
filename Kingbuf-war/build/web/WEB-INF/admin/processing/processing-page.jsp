<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <jsp:include page="../../partials/head-libs.jsp" />
        
        <base href="${pageContext.request.contextPath}/">
        <link rel="stylesheet" href="public/admin/processing/processing-page.css" />
        <title>KingBuf - Nhà hàng của mọi nhà</title>
    </head>

    <body>
        <!-- Header -->
        <jsp:include page="../../partials/page-header.jsp" />

        <!-- Main -->
        <jsp:include page="../../admin/processing/main.jsp" />

        <!-- Footer -->
        <jsp:include page="../../partials/page-footer.jsp" />

        <jsp:include page="../../partials/script-libs.jsp" />
        <script src="public/admin/processing/processing-page.js" defer></script>
    </body>

</html>
