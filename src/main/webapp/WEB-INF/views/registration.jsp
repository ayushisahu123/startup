<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .register-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
        }
        .register-card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-label {
            font-weight: bold;
            margin-top: 10px;
        }
        .btn-custom {
            background: #4e73df;
            color: white;
            font-weight: bold;
        }
        .btn-custom:hover {
            background: #2e59d9;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h2>Register</h2>

    <!-- Registration Form -->
    <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/register">
        <div class="form-group">
            <label class="form-label">Username</label>
            <form:input path="username" cssClass="form-control" placeholder="Enter your username"/>
        </div>

        <div class="form-group">
            <label class="form-label">Email</label>
            <form:input path="email" cssClass="form-control" placeholder="Enter your email"/>
        </div>

        <div class="form-group">
            <label class="form-label">Password !</label>
            <form:password path="password" cssClass="form-control" placeholder="Enter password"/>
        </div>

        <button type="submit" class="btn btn-custom btn-block mt-3" >Register</button>
    </form:form>

    <div class="text-center mt-3">
        <small>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></small>
    </div>
</div>

<!-- ✅ Popup Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ${message}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Auto-show popup if message exists -->
<c:if test="${not empty message}">
    <script>
        $(document).ready(function(){
            $('#messageModal').modal('show');
        });
    </script>
</c:if>

</body>
</html>
