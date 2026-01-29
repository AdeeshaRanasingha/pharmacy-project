<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Controller.DBConnector, Services.FeedbackService" %>
<%@ page import="Model.UserModel" %>

<%
    String userIdStr = (String) session.getAttribute("userID");
    if (userIdStr == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userID = Integer.parseInt(userIdStr);

    // Prepare user details for the feedback form
    String firstname = "", lastname = "", email = "", phone = "";
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT firstname, lastname, email, phone FROM user_info WHERE userID = ?")) {

        stmt.setInt(1, userID);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            firstname = rs.getString("firstname");
            lastname = rs.getString("lastname");
            email = rs.getString("email");
            phone = rs.getString("phone");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user != null) {
%>
    <jsp:include page="header.jsp" />
<%
    } else {
%>
    <jsp:include page="unregisterHeader.jsp" />
<%
    }
%>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-sm p-4" style="max-width: 700px; width: 100%;">
        <h4 class="text-primary mb-4 text-center"><i class="fas fa-comment-dots"></i> Submit Message</h4>

<form id="feedbackForm" name="feedbackForm" action="submitFeedback" method="post"> <!-- lock uID and give access to edit other fields -->
            <input type="hidden" name="userID" value="<%= userID %>">

            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">User ID</label>
                    <input type="text" class="form-control" value="<%= userID %>" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" name="firstname" value="<%= firstname %>" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lastname" value="<%= lastname %>" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control" name="email" value="<%= email %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="text" class="form-control" name="phone" value="<%= phone %>">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea class="form-control" name="message" rows="4" placeholder="Enter your thoughts here ..." required></textarea>
            </div>
            
            <div class="d-flex justify-content-center gap-3 mt-4">
		    <button type="submit" class="btn btn-primary px-4">
		        <i class="fas fa-paper-plane"></i> Submit Message
		    </button>
		    
		    <a href="viewFeedback.jsp?userID=<%= userID %>" class="btn btn-outline-secondary px-4">
		        <i class="fas fa-comments"></i> View My Messages
		    </a>
		</div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />
<script> // js validation for email and phonenumber

    document.getElementById("feedbackForm").onsubmit = function () {
        var email = document.feedbackForm.email.value;
        var phone = document.feedbackForm.phone.value;

        // Email must have @ and end with .com or .lk
        var emailOk = email.indexOf("@") > 0 && (email.endsWith(".com") || email.endsWith(".lk"));

        // Phone: must start with 07, be 10 digits, all numbers
        var phoneOk = phone.length == 10 && phone.startsWith("07") && !isNaN(phone);

        if (!emailOk) {
            alert("Enter a valid email ending with .com or .lk");
            return false;
        }

        if (!phoneOk) {
            alert("Phone must be 10 digits and start with 07");
            return false;
        }

        return true;
    };
</script>
</body>
</html>
