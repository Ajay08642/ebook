<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="BookStore.view" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>Order Confirmation</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Order Confirmation</h2>

        <asp:GridView ID="GridViewOrderSummary" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SNo" HeaderText="S.No." />
                <asp:BoundField DataField="Name" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="StockQuantity" HeaderText="Quantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
            </Columns>
        </asp:GridView>

        <h3>Total Amount: <asp:Label ID="LabelTotalAmount" runat="server" /></h3>

        <asp:Button ID="BtnConfirmOrder" runat="server" Text="Confirm Order" OnClick="BtnConfirmOrder_Click" />
        <asp:Button ID="BtnCancelOrder" runat="server" Text="Cancel Order" OnClick="BtnCancelOrder_Click" />
    </form>
</body>
</html>
