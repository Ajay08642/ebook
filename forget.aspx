<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="Loginform.forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .container
        {
            background-color:grey;
            width:400px;
            height: 250px;
            margin-top:80px;
            border-radius:10px;
        }
        .button{
          color:white;
          background-color:black;
          margin-top: 10px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <table>
                <tr>
                 <td> <asp:Label ID="Label1" runat="server" Text="Old Password:"></asp:Label></td><br />
               <td> <asp:TextBox ID="oldpassword" runat="server"></asp:TextBox></td>
           </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="New Password:"></asp:Label><br /></td>
               <td> <asp:TextBox ID="newpassword" runat="server"></asp:TextBox></td>
            </tr>
                <tr>

                 <td>
                <asp:Label ID="Label3" runat="server" Text="Re-Enter password:"></asp:Label><br /></td>
               <td> <asp:TextBox ID="conpassword" runat="server"></asp:TextBox></td>
            </tr>
                <tr>
                    <td  >
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td><br />
                    <td>
                      &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp  <asp:Button ID="update" CssClass="button" runat="server" Text="Update"  OnClick="update_Click"/>
                    </td>
</tr>
            </table>
              
        </div>
    </form>
</body>
</html>
