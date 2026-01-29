<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Feedback" %>
<%@ page import="Services.FeedbackService" %>

<%@ page import="Model.UserModel" %>




<%
String userIdStr = (String) session.getAttribute("userID");
if (userIdStr == null) {
    response.sendRedirect("login.jsp");
    return;
}
int userID = Integer.parseInt(userIdStr); 
    //Integer userID = (Integer) session.getAttribute("userID");
    List<Feedback> feedbackList = FeedbackService.getFeedbackByUserId(userID);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
UserModel user = (UserModel) session.getAttribute("user");

    if (user != null ) {
%>
    <jsp:include page="header.jsp" />
<%
    } else {
%>
    <jsp:include page="unregisterHeader.jsp" />
<%
    }
%>

<div class="container mt-5">


    <!-- Displaying Feedback Count -->
    <div class="alert alert-secondary text-center fw-bold">
        You have send <%= feedbackList.size() %> Messages<%= feedbackList.size() == 1 ? "" : "s" %>.
    </div>


    <!-- provide feedback button logic -->
<div class="d-flex justify-content-between align-items-center mb-3">
    <h4><i class="fas fa-comments"></i> Your Messages</h4>

    <% if (feedbackList.size() == 0) { %>
        <a href="feedback.jsp" class="btn btn-success">
            <i class="fas fa-plus-circle"></i> Send Message
        </a>
    <% } else { %>
        <a href="feedback.jsp" class="btn btn-success">
            <i class="fas fa-plus-circle"></i> Send Another Message
        </a>
    <% } %>
</div>


    <%// alerts section ...
        String status = request.getParameter("status");
        if ("success".equals(status)) {
    %>
        <div id="feedbackAlert" class="alert alert-success text-center">
            <i class="fas fa-check-circle"></i> Message submitted successfully!
        </div>
    <% } else if ("updated".equals(status)) { %>
        <div id="feedbackAlert" class="alert alert-info text-center">
            <i class="fas fa-edit"></i> Message updated successfully!
        </div>
    <% } else if ("deleted".equals(status)) { %>
        <div id="feedbackAlert" class="alert alert-danger text-center">
            <i class="fas fa-trash-alt"></i> Message deleted successfully!
        </div>
    <% } %>

    <table class="table table-bordered table-striped table-hover mt-3">
        <thead class="table-primary text-center">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody class="text-center">
        <%
            for (Feedback fb : feedbackList) {
        %>
            <tr>
                <td><%= fb.getFirstname() + " " + fb.getLastname() %></td>
                <td><%= fb.getEmail() %></td>
                <td><%= fb.getPhone() %></td>
                <td><%= fb.getMessage() %></td>
                <td><%= fb.getSubmittedAt() %></td>
                <td>
                    <a href="updateFeedback.jsp?id=<%= fb.getId() %>" class="btn btn-sm btn-warning">Update</a>
                    <a href="deleteFeedback?id=<%= fb.getId() %>" class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this Message?');">
                        Delete
                    </a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- alerts hideing JS part -->
<script>
    setTimeout(function () {
        const alert = document.getElementById("feedbackAlert");
        if (alert) {
            alert.style.display = "none";
            // Clear ?status= from URL
            const url = new URL(window.location);
            url.searchParams.delete("status");
            window.history.replaceState({}, document.title, url);
        }
    }, 1500);
</script>

<jsp:include page="footer.jsp" />



</body>
</html>
