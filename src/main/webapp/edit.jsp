<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.user.EditBean"%>
<%@page import="utility.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier l'utilisateur</title>
</head>
<body>
<%@ include file="header.jsp"%>
  <main class="login-form">
  <div class="cotainer">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">
            Modification d'utilisateur
            
          </div>
            <%=ServletUtility.getSuccessMessage(request)%>
            <%=ServletUtility.getErrorMessage(request)%>
            <jsp:useBean id="bean" class="model.user.EditBean" scope="request"></jsp:useBean>
            
          <div class="card-body">
            <form action="editController" method="post">
              <input type="hidden" name="id" value="<%=ServletUtility.getStringData(bean.getId())%>"> 
              <div class="form-group row">
                <label for="email_address" 
                  class="col-md-4 col-form-label text-md-right">First Name<font color="red"></font></label>
                <div class="col-md-6">
                  <input type="text"   class="form-control" placeholder="Enter First Name"
                    name="firstname" value="<%=ServletUtility.getStringData(bean.getFirstname())%>">
                    <font  color="red"></font>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="email_address" 
                  class="col-md-4 col-form-label text-md-right">Last Name<font color="red"></font></label>
                <div class="col-md-6">
                  <input type="text"   class="form-control" placeholder="Enter Last Name"
                    name="lastname" value="<%=ServletUtility.getStringData(bean.getLastname())%>" >
                    <font  color="red"></font>
                </div>
              </div>
              <div class="form-group row">
                <label for="email_address" 
                  class="col-md-4 col-form-label text-md-right">Email<font color="red"></font></label>
                <div class="col-md-6">
                  <input type="text" id="email_address"  class="form-control" placeholder="Enter Login Id"
                    name="email" value="<%=ServletUtility.getStringData(bean.getEmail())%>" >
                    <font  color="red"></font>
                </div>
              </div>
              
              
              <div class="form-group row">
                <label for="email_address" 
                  class="col-md-4 col-form-label text-md-right">Role<font color="red"></font></label>
                <div class="col-md-6">
                  <input type="text"  id="datepicker" class="form-control" placeholder="Enter Date Of Birth"
                    name="role" value="<%=ServletUtility.getStringData(bean.getRole())%>" >
                    <font  color="red"></font>
                </div>
              </div>
              
              <div class="col-md-6 offset-md-4">
                <input type="submit" class="btn btn-primary" name="operation" value="Enregistrer">
                
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  </main>
  <div style="margin-top: 120px">
    <%@ include file="footer.jsp"%>
  </div>
</body>
</html>