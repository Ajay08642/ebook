``<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Loginform.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .contain {
            border-radius: 2rem;
            width: 360px;
            height: 530px;
            text-align: center;
            color: black;
            background-color: white;
            margin-left: 40%;
            margin-top: 0%;
            margin-bottom: 14%;
            background-color: white;
        }

        body {
            background-color: aquamarine;
        }

        td {
            txt-align: center;
        }

        table {
            text-align: center;
        }

        .auto-style1 {
            margin-left: 0px;
        }

        .auto-style2 {
            margin-left: 20px;
            margin-top: 18px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div class="contain">
            <table>
                <tr>
                    <td colspan="2" align="center">
                        <h2>Registration Page    </h2>
                    </td>
                </tr>
                <%--<tr>
                    <td><b>ID:</b></td>
                    <td>
                        <asp:TextBox ID="txtid" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td><b>First Name:</b></td>
                    <td>
                        <asp:TextBox ID="txtfirst" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtfirst" SetFocusOnError="true" ForeColor="#ff0000" ErrorMessage="Please enter name"></asp:RequiredFieldValidator><br />

                <tr>
                    <td><b>Last Name:</b></td>
                    <td>
                        <asp:TextBox ID="txtlast" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtlast" ForeColor="#ff0000" BackColor="YellowGreen" ErrorMessage="Please enter last name"></asp:RequiredFieldValidator><br />

                </tr>
                <tr>
                    <td><b>Email ID:</b></td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtemail" ForeColor="#ff0000" ErrorMessage="Please enter email" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid email" ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator><br />


                <tr>
                    <td><b>Gender:</b></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="31px" Width="127px">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>FeMale</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><b>Address:</b></td>
                    <td>
                        <asp:TextBox ID="txtadd" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><b>Phone Number:</b></td>
                    <td>
                        <asp:TextBox ID="txtphone" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><b>Password:</b></td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><b>Confirm Password:</b></td>
                    <td>
                        <asp:TextBox ID="txtrepass" runat="server" Height="34px" Width="123px"></asp:TextBox>
                    </td>
                </tr>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="password id incorect" ForeColor="red" ControlToCompare="txtpass" ControlToValidate="txtrepass" Display="Dynamic"></asp:CompareValidator>
               UserType</b></td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style1" Height="31px" Width="127px">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Register" Height="34px" Width="150px" OnClick="Button1_Click" CssClass="auto-style2" CausesValidation="True" /></td>
                    <td>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>




        </div>

    </form>
</body>
</html>
