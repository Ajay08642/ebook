<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="BookStore.welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        .nav-item {
            width: 100%;
        }

        .btn btn-primary {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- <div>
            <asp:Label ID="Label1" runat="server" Text="Login sucessfull" ForeColor="#ff3399"></asp:Label>
            Response.Write("<script>alert('Login successfully')</script>");

                      
        </div>--%>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">EBook Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <li class="nav-item">
            <a class="nav-link" href="#">Cart</a>
        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">LogOut</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <br />
        <asp:Repeater ID="DataList1" runat="server">
            <ItemTemplate>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
        <div class="row">
            <div class="col-4">
                <div class="card" style="width: 25rem; text-align: center; background-color: yellow">
                    <div class="card-body">
                        <img src="images/1.jpg" alt="book" width="328rem" height="450rem"><br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="ProductID"></asp:Label>

                        <a href="cart.aspx" class="btn btn-primary">Add To Cart</a>
                    </div>
                </div>

            </div>
            <div class="col-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <img src="images/2.jpg" class="rounded" alt="book2" width="328rem"><br />
                        <a href="#" class="btn btn-primary ">Buy</a>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <img src="images/3.jpg" class="rounded" alt="book3" width="328rem" /><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/4.jpg" alt="book"><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>

            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/5.jpg" class="rounded" alt="book2"><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/6.jpg" class="rounded" alt="book3" /><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/7.jpg" alt="book"><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>

            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/8.jpg" class="rounded" alt="book2"><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img src="images/9.jpg" class="rounded" alt="book3" /><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card" style="width: 18rem; text-align: center">
                    <div class="card-body">
                        <img src="images/10.jpg" alt="book"><br />
                        <a href="#" class="btn btn-primary">Buy</a>
                    </div>
                </div>

            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>


    </form>
</body>
</html>
