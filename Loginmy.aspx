<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginmy.aspx.cs" Inherits="BookStore.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .gradient-custom {
            background-image: url('<%= ResolveUrl("~/images/bookstore-s.jpg") %>');
            background-size: cover;
            background-position: center;
            height: 100vh;
             opacity:0.7;
            transition: 0.1s ease;
        }
        .card.bg-secondary {
            opacity:0.4;
            transition: 0.1s ease;
            color:transparent;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-50 gradient-custom">
            <div class="container py-5 h-50" >
                <div class="row d-flex justify-content-center align-items-center h-50">
                    <div class="col-12 col-md-7 col-lg-5 col-xl-4">
                        <div class=" bg-transparent text-white" style="border-radius: 1rem;">
                            <div class="card-body p-4 text-center">
                                <div class="md-4 mt-md-3 pb-4">
                                    <h3 class="fw-bold mb-2 text-uppercase" style="margin-top:50px">Login</h3>
                                    <p class="text-white-25 mb-4">Please enter your login and password!</p>
                                    <div class="form-outline form-white mb-55">
                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control form-control-lg" Placeholder="Email"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="form-outline form-white mb-3">
                                        <asp:TextBox ID="TextBox6" runat="server" class="form-control form-control-lg" Placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <p class="small mb-4 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>
                                    <asp:Button ID="Button1" class="btn btn-outline-light btn-lg px-4" runat="server" Text="LogIn" OnClick="Button1_Click" />
                                    <div class="d-flex justify-content-center text-center mt-3 pt-1">
                                        <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-3 px-2"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                    </div>
                                    <div>
                                        <p class="mb-0">
                                            Don't have an account? <a href="Register.aspx" class="text-white-50 fw-bold">Sign Up</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
