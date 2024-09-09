+<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_page.aspx.cs" Inherits="Loginform.admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <%--<script  src="https://use.fontawesome.com/24eb586137.js"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <style>

        .foot{
            width:102px;
        }
       
        .aj{
            width:100px;
        }
        .pk{
            width:80px;
        }
       /* .div {
            margin: 15px;
        }*/

        .header {
            width: 98.5%;
            background-size: auto;
            background-color: green;
            position: center;
            height: auto;
            margin-left:10px;  
            margin-bottom:10px;
            
           
            
        }

        nav {
            display: flex;
           /* justify-content: space-between;
            align-items: center;
            color:blue;*/
            
            
        }

            nav img {
                width: 110px;
                
                height: 40px;
                
            }

        .nav-links {
            flex: 1;
            text-align: right;
            height: 33px;
            color:blue;
            margin-left:30px;
            
        }

            .nav-links ul li {
                list-style: none;
                display: inline-block;
                padding: 8px 12px;
                position: relative;
          
             color:white;
             margin-right:20px;
             
               
            }

                .nav-links ul li a {
                    text-decoration: none;
                    color: black;
                    font-size: 15px;
                    color:white;
                    margin-right:-20px;
                }

                .nav-links ul li::after {
                    content: '';
                    width: 0%;
                    height: 1px;
                    display: block;
                    background: #f44336;
                    margin: auto;
                    transition: 0.5s;
                }

                .nav-links ul li:hover::after {
                    width: 100%;
                }
                .img
                {
                    border-radius:90%;
                    width:30px;
                    height:30px;
                   margin-top:0px;
                   margin-left:5px;
                }
                
                

      
    </style>


</head>
<body>
    <form id="form1" style="margin:auto"  runat="server">



       
            <section class="header">
                <nav>
                    <a href="#">
                        <img src="../images/logo.png"  />
                    </a>
                    <div class="nav-links">
                        <ul>
                           
                            <i class="fa-solid fa-house"></i><li><a href="#"> Home </a></li>
                             <i class="fa-solid fa-lock"></i><li><a href="#">Admin</a></li>
                            <i class="fa-solid fa-users"></i><li><a href="#">User</a></li>
                           
                             <li style="padding-left:520px; margin-bottom:1px">
                                <asp:Image ID="Image3" CssClass="img" runat="server" />
                             <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                        </li>
                            <li> <asp:ImageButton ID="btndelete" runat="server"  ImageUrl="~/images/delete2.png" ToolTip="DELETE CHECKBOX" style="width:25px; height:35px;padding-top:20px; margin-top:-14px;"  OnClick="btndelete_Click"/></li>
                            <i class="fa-solid fa-square-xmark"></i>
                            <li>                             
                                <asp:LinkButton ID="LinkButton6"  style="margin-right:-30px" runat="server" OnClick="LinkButton6_Click">LogOut </asp:LinkButton>
                            </li>
                           
                            
                        </ul>

                    </div>
                </nav>
            </section>
        
        
        <div>

            <asp:GridView ID="GridView1" runat="server" Width="90%" Height="500px" AutoGenerateColumns="False" HorizontalAlign="Center" ShowFooter="True" OnRowEditing="GridView1_RowEditing" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id">


                <Columns>
                    <asp:TemplateField HeaderText="select all">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkEmpty"  runat="server" OnCheckedChanged="CheckBox1_CheckedChanged"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ID"  >
                        <EditItemTemplate >
                            <asp:TextBox ID="TextBox1" CssClass="pk" runat="server" Text='<%# Eval("id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox11" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" CssClass="pk" runat="server" Text='<%# Eval("firstname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox12" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="pk" runat="server" Text='<%# Eval("lastname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox13" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EmailId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" CssClass="pk" runat="server" Text='<%# Eval("emailid") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox14" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("emailid") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5"  CssClass="pk" runat="server" Text='<%# Eval("gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox15" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" CssClass="pk" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox16" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" CssClass="pk" runat="server" Text='<%# Eval("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox17" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" CssClass="pk" runat="server" Text='<%# Eval("password") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox18" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ConfirmPass">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" CssClass="pk" runat="server" Text='<%# Eval("confirmpass") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox19" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("confirmpass") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserType">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" CssClass="pk" runat="server" Text='<%# Eval("userType") %>'></asp:TextBox>

                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox CssClass="foot" ID="TextBox20" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("userType") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Images">
                        <EditItemTemplate>
                            <asp:Image ID="Image2" runat="server" Width="10px" ImageUrl='<%# Eval("images") %>' />
                            <asp:FileUpload CssClass="aj" ID="FileUpload1" runat="server"  />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload CssClass="foot" ID="FileUpload2" runat="server" Width="100px" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="50px" ImageUrl='<%# Eval("images") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Option" HeaderStyle-CssClass="text-left" HeaderStyle-Width="20px">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update">Update</asp:LinkButton>
                            &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton CssClass="foot" ID="LinkButton5" runat="server" CommandName="Insert" OnClick="LinkButton5_Click">Insert</asp:LinkButton>
                        </FooterTemplate>

                        <ItemTemplate>
                            <div class="d-flex justify-contains-center">
                            <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="Edit">Edit</asp:LinkButton>
                         &nbsp&nbsp
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                              
                               </div>
                        </ItemTemplate>

                    <HeaderStyle CssClass="text-left" Width="20px"></HeaderStyle>

                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>

                  

                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="center" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </div>
        <asp:Label ID="Label15" runat="server"></asp:Label>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AJAYConnectionString3 %>" DeleteCommand="DELETE FROM [Registers] WHERE [id] = @id" InsertCommand="INSERT INTO [Registers] ([firstname], [lastname], [emailid], [gender], [address], [phone], [password], [confirmpass], [userType]) VALUES (@firstname, @lastname, @emailid, @gender, @address, @phone, @password, @confirmpass, @userType)" SelectCommand="SELECT * FROM [Registers]" UpdateCommand="UPDATE [Registers] SET [firstname] = @firstname, [lastname] = @lastname, [emailid] = @emailid, [gender] = @gender, [address] = @address, [phone] = @phone, [password] = @password, [confirmpass] = @confirmpass, [userType] = @userType"></asp:SqlDataSource>

    </form>



</body>
</html>
