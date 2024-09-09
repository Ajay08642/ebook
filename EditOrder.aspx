<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="BookStore.EditOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 57%;
            height: 284px;
        }
        .auto-style2 {
            width: 396px;
        }
        .auto-style3 {
            width: 226px;
            background-color: #CCFFFF;
        }
        .auto-style4 {
            background-color: #CCFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1" border="1">
                <tr>
                    <td class="auto-style3">SNo</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                       
                    </td>
                <tr>
                    <td class="auto-style3">ProductID</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Name</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Description</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Price</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">StockQuantity</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style4" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Total Price</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style4" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Height="29px" Text="Save" Width="87px" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
