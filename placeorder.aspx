<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="placeorder.aspx.cs" Inherits="BookStore.placeorder" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 38%;
            height: 0px;
        }
        .auto-style2 {
            width: 104px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">OrderId</td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">OrderDate</td>
                    <td>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SNo" HeaderText="SNo" />
                <asp:ImageField DataImageUrlField="ImageURL" HeaderText="ImageURL">
                </asp:ImageField>
                <asp:BoundField DataField="ProductIT" HeaderText="ProductID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
                <asp:BoundField DataField="StockQuantity" HeaderText="StockQuantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" />
            </Columns>
        </asp:GridView>

       
    </form>
</body>
</html>
