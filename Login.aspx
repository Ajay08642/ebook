<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Loginform.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title></title>
    <link href="images/124230368.jpg" rel="stylesheet" />
    <style>
        * {
            margin: 0%;
            padding: 0%;
        }

        body {
            background-image: url("../images/124230368.jpg");
            background-repeat: no-repeat;
            background-size: 100% 740px;
        }

        .contain {
            border-radius: 2rem;
            width: 300px;
            height: 450px;
            text-align: center;
            color: white;
            background-color: black;
            margin-left: 40%;
            margin-top: 6%;
        }

            .contain h1 {
                font-size: 36px;
                color: aqua;
            }

            .contain .text {
                position: relative;
                top: 7%;
            }

        .user {
            border: none;
            color: white;
            background-color: black;
            border-bottom: 3px solid white;
            width: 250px;
            font-size: 20px;
            margin-top: 40px;
            outline: none;
           
        }

        .pass {
            border: none;
            color: white;
            background-color: black;
            border-bottom: 3px solid white;
            width: 250px;
            font-size: 20px;
            margin-top: 40px;
            outline: none;
            
        }

        p {
            margin-top: 30px;
            font-size: 20px;
        }

            p  {
                color: aqua;
            }

        .button {
            width: 250px;
            height: 44px;
            background-color: aqua;
            color: black;
            border: none;
            font-size: 24px;
            border-radius: 25px;
            margin-top: 25px;
            cursor: pointer;
        }

            .button:hover {
                border: 3px solid aqua;
                color: white;
                background-color: black;
            }
            .col{
                color: deepskyblue;
            }
    </style>

    <script type="text/javascript">
        function showAlert() {
            alert('Login Successfully');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="contain">
            <div class="text">
                <h1>Login </h1>
                <asp:TextBox ID="txtemail" runat="server" CssClass="user" PlaceHolder="Enter Email" autocomplete="off">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="txtemail" ErrorMessage="UserName required" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPass" runat="server" CssClass="pass" PlaceHolder="Enter password" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="password" runat="server" ControlToValidate="txtPass" ErrorMessage="password required" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                <p align="center">
                    <asp:HyperLink ID="HyperLink2" runat="server" href="forget.aspx" ForeColor="Red"> Change Password</asp:HyperLink>
                   </p>
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="Login" OnClick="btnLogin_Click" /><br />
                <p>
                    <asp:Label ID="Label2" runat="server" Text="Not a member?"></asp:Label>
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="register.aspx" CssClass="col">SignUp</asp:HyperLink></p>
                       
                
               
               

            </div>
        </div>
    </form>
</body>
</html>
