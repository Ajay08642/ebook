<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Loginform.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
        .body
        {
            background-color:purple;
            outline-style:double;
            width:20%;
            height:100%;
        }
        .user
        {
            text-align:center;
            font-size:20px;
        }
        div
        {
            text-align:center;
            background-color:aqua;
            
            height:100%;
           
        }
        .text1
        {

        }
        .button
        {
          background-color:red;
         width:200px;
         margin:20px;
           color:white;
        }
        .password
        {
         font-size:20px;  
       
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h1 ->Log In Page</h1>
        
            <asp:Label ID="Label1" CssClass="user" runat="server"  Text="UserName"></asp:Label> <br />
            <asp:TextBox ID="txtUser" CssClass="text1" runat="server"></asp:TextBox></br>
            <asp:Label ID="Label2" CssClass="password" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox><br /><br />
          <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Login" />
            </div>
    </form>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</body>
</html>
