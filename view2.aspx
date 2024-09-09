<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view2.aspx.cs" Inherits="BookStore.view2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Summary</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Order Summary</h2>
            <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server"></asp:Label></p>
            <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server"></asp:Label></p>
            <p><strong>Item:</strong> <asp:Label ID="lblItem" runat="server"></asp:Label></p>
            <p><strong>Quantity:</strong> <asp:Label ID="lblQuantity" runat="server"></asp:Label></p>
            <asp:Button ID="btnFinalize" Text="Finalize Purchase" OnClick="btnFinalize_Click" runat="server" />
            <asp:Button ID="btnEdit" Text="Edit Order" OnClick="btnEdit_Click" runat="server" />
        </div>
    </form>
</body>
</html>
