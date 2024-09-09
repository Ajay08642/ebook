<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="BookStore.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
         .container
         {
             width:80px;
             height:100px;
         }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        
      <section class="h-100 bg-primary">
  <div class="container  h-100 w-100 ">
    <div class="row d-flex justify-content-center align-items-center">
      <%--<div class="col">--%>
        <div class="card card-registration my-4 w-50">

        
            <div class="col">
              <div class="card-body p-md-1 text-black">
                <h3 class="mb-5 text-uppercase " style="padding-top:20px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Registration form</h3>

                <div class="row">
                
                  <div class="col-md-12 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control form-control-lg"></asp:TextBox>    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="please enter user name" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" SetFocusOnError="true" > </asp:RequiredFieldValidator>
                        <label class="form-label" for="form3Example1n">User Name</label>
                    </div>
                  </div>
                </div>
                  
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <asp:TextBox ID="TextBox3" runat="server" class="form-control form-control-lg"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter name" ForeColor="Red" ControlToValidate="TextBox3" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                      <label class="form-label" for="form3Example1m">First name</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <asp:TextBox ID="TextBox4" runat="server" class="form-control form-control-lg"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter last name" ForeColor="Red" ControlToValidate="TextBox4" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                      <label class="form-label" for="form3Example1n">Last name</label>
                    </div>
                  </div>
                </div>
                  
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <asp:TextBox ID="TextBox5" runat="server"  class="form-control form-control-lg"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please enter email" ControlToValidate="TextBox5" SetFocusOnError="True" Display="Dynamic"  ForeColor="#FF0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Email Invalid" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox5"></asp:RegularExpressionValidator>
                      <label class="form-label" for="form3Example1m">Email</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div data-mdb-input-init class="form-outline">
                      <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" class="form-control form-control-lg"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please enter password" ForeColor="#ff0000" Display="Dynamic" ControlToValidate="TextBox6" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      <label class="form-label" for="form3Example1n">Password</label>
                    </div>
                  </div>
                </div>
                  
                <div class="row">
                  <div class="col-md-12 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <asp:TextBox ID="TextBox7" runat="server" class="form-control form-control-lg"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please enter address" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                      <label class="form-label" for="form3Example1m">Address</label>
                    </div>
                  </div>
                 

               
                <div class="d-flex justify-content-end pt-53">
                 
                    <asp:Button ID="Button1" class="btn btn-primary btn-lg ms-2" runat="server" Text="Sign Up" OnClick="Button1_Click" />
               
                    <a href="LoginF.aspx" class="btn btn-primary btn-lg ms-2"  type="button">login </a>
       
                     </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  
</section>
            
    </form>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</body>
</html>
