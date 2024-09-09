<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormplace.aspx.cs" Inherits="BookStore.WebFormplace" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style type="text/css">
       /* Box shadow for tables */
/* Box shadow for table */
.table-custom {
    width: 40%;
    margin-bottom: 1rem;
    box-shadow: 0 4px 8px rgba(128, 128, 128, 0.3); /* Grey color with 30% opacity */
}

/* Box shadow for card body */
.card-body {
    box-shadow: 0 0 15px -2px rgba(128, 128, 128, 0.5); /* Grey color with 50% opacity */
}

/* Box shadow for buttons */
.btn-custom {
    box-shadow: 0 4px 8px rgba(128, 128, 128, 0.3); /* Grey color with 30% opacity */
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center">
            <div class="card" style="width: 80rem; margin: 30px;">
                <div class="card-body">
                    <div>
                        <table class="table table-bordered table-custom">
                            <tr>
                                <td>OrderId</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Order ID"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>OrderDate</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Order Date"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" GridLines="Horizontal" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="SNo" HeaderText="SNo">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="ImageURL" HeaderText="ImageURL" ControlStyle-Height="40px">
                                <ItemStyle HorizontalAlign="left" height="10px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" HeaderText="Price">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StockQuantity" HeaderText="StockQuantity">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="50px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right"/>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>

                    <table class="table table-bordered table-custom">
                        <tr>
                            <td>Type Your Address</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </td>
                        </tr>
                        <div class="form-group">
                            <tr>
                                <td>
                    <label for="shippingMethod">Preferred Shipping Method:</label></td>
                                <td>
                    <asp:DropDownList ID="ddlShippingMethod" CssClass="form-control" runat="server">
                        <asp:ListItem Text="Standard Shipping" Value="Standard" />
                        <asp:ListItem Text="Express Shipping" Value="Express" />
                        <asp:ListItem Text="Overnight Shipping" Value="Overnight" />
                    </asp:DropDownList>
                                    </td>
                                </tr>
                </div>
                    </table>
                    
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary btn-custom" Text="Place Order" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
