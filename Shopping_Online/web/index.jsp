<%-- 
    Document   : index.jsp
    Created on : Feb 28, 2022, 9:06:36 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <%@include file= "components/navbar.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With style of you</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-sm-2">
                        <h3>List Category</h3>
                        <ul class="list-group">
                            <c:forEach items = "${sessionScope.listCategories}" var = "C">
                                <li class="list-group-item"><a href = "filter-category?categoryId=${C.id}">${C.name}</a></li>
                                </c:forEach>

                        </ul></div>
                    <div class="col-md-9">
                        <h3>List Products</h3>
                        <c:choose>
                            <c:when test="${listProducts==null || listProducts.size()==0}">
                                NOT FOUNDS
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example"class = "d-flex justify-content-center">
                                    <ul class="pagination">                                
                                        <li class="page-item ${page == 1?"disabled":""}"><a class="page-link" href="home?page=${page-1}">Previous</a></li>
                                            <c:forEach begin="1" end="${totalPage}" var = "i">
                                            <li class="page-item ${i==page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                            </c:forEach>

                                        <li class="page-item ${page >= totalPage ?"disabled":""}"><a class="page-link" href="home?page=${page+1}">Next</a></li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3  justify-content-center">
                            <c:forEach items = "${listProducts}" var = "P" >
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}"><img class="card-img-top" src="${P.imageUrl}" alt="..." /></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$20.00</span>
                                                $${P.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" onclick="addToCartAsync(${P.id})"
                                                   >Add to cart</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">quanghai12112001@gmail.com</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
                                                function addToCartAsync(productId) {
                                                    axios.get('add-to-cart-async', {
                                                        params: {
                                                            productId: productId    
                                                        }
                                                    }).then((response) => {
                                                        //lay data thanh cong   
                                                        document.getElementById("cart_number").innerHTML = response.data;
                                                        //cap nhat view

                                                    })
                                                }
        </script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

