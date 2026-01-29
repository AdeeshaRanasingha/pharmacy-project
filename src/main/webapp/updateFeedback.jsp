<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Feedback" %>
<%@ page import="Services.FeedbackService" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Feedback fb = FeedbackService.getFeedbackById(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp" />

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-sm p-4" style="max-width: 700px; width: 100%;">
        <h4 class="text-primary mb-4 text-center"><i class="fas fa-edit"></i> Update Message</h4>

<form id="updateForm" name="updateForm" action="updateFeedback" method="post">            <!-- lock uID and give access to edit other details to user -->
            <input type="hidden" name="id" value="<%= fb.getId() %>">

            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">User ID</label>
                    <input type="text" class="form-control" value="<%= fb.getUserID() %>" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" name="firstname" value="<%= fb.getFirstname() %>" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lastname" value="<%= fb.getLastname() %>" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control" name="email" value="<%= fb.getEmail() %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="text" class="form-control" name="phone" value="<%= fb.getPhone() %>">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea class="form-control" name="message" rows="4" placeholder="Enter your thoughts here ..." required><%= fb.getMessage() %></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary px-5">
                    <i class="fas fa-save"></i> Update Message
                </button>
            </div>
        </form>
    </div>
</div>
<script>
// ✅ JS validation for email and phone in update form
document.getElementById("updateForm").onsubmit = function () {
    var email = document.updateForm.email.value;
    var phone = document.updateForm.phone.value;

    // Email must have @ and end with .com or .lk
    var len = email.length;
    var at = email.indexOf("@");
    var endCom = email.substring(len - 4) == ".com";
    var endLk = email.substring(len - 3) == ".lk";
    var emailOk = at > 0 && (endCom || endLk);

    // Phone must start with 07, be 10 digits, and be numeric
    var phoneOk = phone.length == 10 && phone.substring(0, 2) == "07" && !isNaN(phone);

    if (!emailOk) {
        alert("Please enter a valid email ending with .com or .lk");
        return false;
    }

    if (!phoneOk) {
        alert("Phone number must be 10 digits and start with 07");
        return false;
    }

    return true;
};
</script>
<jsp:include page="footer.jsp" />
</body>
</html>
