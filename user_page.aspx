<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_page.aspx.cs" Inherits="Loginform.user_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       
    <title></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        * {
            margin: 5px;
            padding: 0;

        }
     
          .header {
            width: 98%;
            background-size: auto;
            background-color: cadetblue;
            position: center;
            height: 50px;
            margin-left:15px;  
            margin-bottom:10px;
            margin-top:10px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            nav img {
                width: 130px;
                
                height: 30px;
            }

        .nav-links {
            flex: 1;
            text-align: right;
            height: 60px;
        }

            .nav-links ul li {
                list-style: none;
                display: inline-block;
                padding: 8px 12px;
                position: relative;

            }

                .nav-links ul li a {
                    text-decoration: none;
                    color: black;
                    font-size: 15px;
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
                .img{
                    width:30px;
                    height:30px;
                    border-radius:50%;
                    margin-top:0px;
                }


    </style>
</head>
<body>  
        

        <section class="header">
            <nav>
                <a href="#">
                    <img src="../images/logo.png" /></a>
                <div class="nav-links">
                    <ul><li>
                        <asp:Image ID="Image3" CssClass="img" runat="server" />
                       
                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></li>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Admin</a></li>
                        <li><a href="#">User</a></li>
                        <li><a href="Login.aspx">LogIn</a></li>
                        
                   
      <li>
<button type="button" class="btn btn-dark btn-sm"  data-bs-toggle="modal"  data-bs-target="#exampleModal">
  Edit
</button>
          </li>


            </nav>
        </section>   


    <br />
    <form id="form1" runat="server">
        <div>         
            

             <asp:GridView ID="GridView1" runat="server" Width="100%" Height="500px" AutoGenerateColumns="False" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>

                        <asp:TemplateField HeaderText="ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>&nbsp
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("firstname") %>'>

                                </asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("firstname") %>'>   </asp:Label>&nbsp&nbsp
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("lastname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmailId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("emailid") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("emailid") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("gender") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("password") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ConfirmPass">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("confirmpass") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("confirmpass") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="UserType">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Eval("userType") %>'></asp:TextBox>

                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("userType") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Images">
                            <EditItemTemplate>
                                <asp:Image ID="Image2" runat="server" Width="10px" ImageUrl='<%# Eval("images") %>' />
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="47px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" Height="29px" Width="198px" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Width="130px" ImageUrl='<%# Eval("images") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="left" />
                        </asp:TemplateField>

                       
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                <asp:Label ID="Label15" runat="server"></asp:Label>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AJAYConnectionString3 %>"   SelectCommand="SELECT * FROM [Registers]" UpdateCommand="UPDATE [Registers] SET [firstname] = @firstname, [lastname] = @lastname, [emailid] = @emailid, [gender] = @gender, [address] = @address, [phone] = @phone, [password] = @password, [confirmpass] = @confirmpass, [userType] = @userType"></asp:SqlDataSource>
            

        </div>

        <br />

        <!--modal-->
               <div class="modal" id="exampleModal" aria-labelledby="exampleModalLabel" tabindex="-1" aria-hidden="false">

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
    <h5 class="modal-title" id="exampleModelLabel">User Details</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
          
      
        <div class="modal-body">
            
    <div class="form-group mb-3">
        <asp:TextBox ID="txtid" runat="server" CssClass="form-control" placeholder="Enter Id"></asp:TextBox>
    </div>
    <div class="form-group mb-3">
        <asp:TextBox ID="txtfirst" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtlast" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtgender" runat="server" CssClass="form-control" placeholder="Enter Gender"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="Enter address"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" placeholder="Enter Phone Number"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtconfirm" runat="server" CssClass="form-control" placeholder="Enter ConfirmPassword"></asp:TextBox>
    </div>

    <div class="form-group mb-3">
        <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="Enter UserType"></asp:TextBox>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <asp:Button ID="button" runat="server" Text="Save Change" CssClass="btn btn-primary" OnClick="button_Click" />
    </div>
</div>

        </div>
        </div>
    
    </form>
</body>
</html>








