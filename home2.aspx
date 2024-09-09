<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home2.aspx.cs" Inherits="Loginform.home2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
   <style>
       body
       {
           background-image:url("../images/banner.png");
           background-size: 100%;
         
       }
       .navbar
       {
color:red;
       }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-info bg-in">
  <div class="container-fluid">
    <%--<a class="navbar-brand" href="#">Navbar</a>--%>
    <%--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>--%>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
          </ul>
        <ul class="navbar-nav" style="margin-left:auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Admin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">LogOut</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
        </div>
    </form>
</body>
</html>
