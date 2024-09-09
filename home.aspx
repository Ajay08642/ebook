<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Loginform.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
       *
       {
           margin:0;
           padding: 0;
       }
       .header{
           min-height:100vh;
           width:100%;
           background-image: linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url("../images/banner.png");
           background-size: cover;
           position: relative;
       }
       nav{
           display:flex;
           padding: 2% 6%;
           justify-content: space-between;
           align-items: center;
       }
       nav img
       {
           width: 150px;
       }
        .nav-links
        {
            flex: 1;
            text-align: right;
        }
        .nav-links ul li
        {
            list-style:none;
            display: inline-block;
            padding: 8px 12px;
            position: relative;
        }
        .nav-links ul li a
        {
            text-decoration:none;
            color: #fff;
            font-size: 23px;
        }
        .nav-links ul li::after
        {
            content:'';
            width: 0%;
            height: 2px;
            display: block;
            background: #f44336;
            margin:auto;
            transition:0.5s;

        }
        .nav-links ul li:hover::after
        {
           width: 100%;
        }
       
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="header">
            <nav>
                <a href="#"><img src="../images/logo.png" /></a>
                <div class="nav-links">
                    <ul>
                <li><a href="#">Home</a></li>
                 <li><a href="#">Admin</a></li>
                 <li><a href="#">User</a></li>
                 <li><a href="Login.aspx">LogIn</a></li>
                        <li><a href="Login.aspx">LogOut</a></li>
            </ul>
        </div></nav>
            </section>
    </form>
</body>
</html>
