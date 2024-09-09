<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="BookStore.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
          
        }

        .auto-style3 {
            text-align: center;
            width:500px;
            
        }
        .navbar-nav
        {
            padding-top:0px;
            width:50px;
          
            
        }
        .navbar-brand
        {
            margin-bottom:10px;
        }
       .collapse navbar-collapse
        {
            margin-bottom:30px;
            padding-top:0px;
            padding-bottom:0px;
        }
       .container-fluid
       {
           height:35px;
       }
       .hyper
       {
           text-decoration:none;
           margin-bottom:-50PX;
       }
       .nav-link
       {
           color:aqua;
       }
      .search
      {
          margin-top:10px;
      }
      
     
         
       
        </style>
</head>
<body>
    <form id="form1" runat="server">
          <nav class="navbar navbar-expand-lg navbar-light bg-info"
              >
            <div class="container-fluid">
               
                <a class="navbar-brand" style="color:orangered" href="#">EBook Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav" >
                        <li class="navbar-brand">
                            <a class="nav-link active" style="color:darkblue"; aria-current="page" href="HomeF.aspx">Home</a>
                        </li>
                        <li class="navbar-brand">
                            <a class="nav-link" style="color:darkblue"; href="#">Features</a>
                        </li>
                        <li class="navbar-brand">
                            <a class="nav-link" style="color:darkblue"; href="#">Pricing</a>
                        </li>
               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <li class="navbar-brand">
                            
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="search"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="search" CssClass="search" OnClick="Button1_Click" />
                        </li>
                        <li class="navbar-brand">
            <a class="nav-link" href="addtocart.aspx" style="color:darkblue">  cart          
                <%--<asp:HyperLink ID="HyperLink1" ForeColor="white" runat="server"   NavigateUrl="addtocart.aspx"> Cart</asp:HyperLink>
                --%>
                <asp:Label ID="Label7" runat="server"></asp:Label>
    

</a></li>
                        <li class="navbar-brand"><a class="nav-link" style="color:darkblue"; href="Login.aspx">LogOut</a> </li>
                    </ul>
                </div>
            </div>
        </nav>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">ViewAllProduct</asp:LinkButton>   
        
        <div>

            <asp:DataList ID="DataList1" runat="server" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="ProductID" DataSourceID="SqlDataSource1" GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="red" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="white" ForeColor="black" />
                <ItemTemplate>
                    <br />
                   
                    <table border="1" class="auto-style1">
                        <tr>
                            <td class="auto-style3" >
                               

                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageURL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label1" runat="server" Text="ProductID"></asp:Label>
                                &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("ProductID")  %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label8" runat="server" Text="Name"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label9" runat="server" Text="Description"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label10" runat="server" Text="Price"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label11" runat="server" Text="Category"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label12" runat="server" Text="StockQuantity"></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
             <asp:ImageButton ID="ImageButton1" runat="server" Height="84px" ImageUrl="~/images/addf.jpg" Width="198px" CommandArgument='<%#Eval("ProductID")%>' CommandName="addtocart" />

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="View.aspx" runat="server" >View</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AJAYConnectionString3 %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AJAYConnectionString3 %>" SelectCommand="SELECT * FROM [product] WHERE ([Name] LIKE '%' + @Name + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Name" PropertyName="Text" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>
    </form>
</body>
</html>
