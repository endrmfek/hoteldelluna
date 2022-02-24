<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <!--Made with love by Mutiullah Samim -->

    <!--Bootsrap 4 CDN-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />

    <!--Custom styles-->

    <link rel="stylesheet" href="assets/css/login.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <header>
      <!-- Header Start -->
      <div class="header-area header-sticky">
        <div class="main-header">
          <div class="container">
            <div class="row align-items-center">
              <!-- logo -->
              <div class="col-xl-2 col-lg-2">
                <div class="logo">
                  <a href="index.html"><img src="assets/img/logo/logo1.png" width="180" height="70" alt="" /></a>
                </div>
              </div>
              <div class="col-xl-8 col-lg-8">
                <!-- main-menu -->
                <div class="main-menu f-right d-none d-lg-block">
                  <nav>
                    <ul id="navigation">
                      <li><a href="index.html">Home</a></li>
                      <li><a href="about.html">Notice</a></li>
                      <li><a href="services.html">Q&A</a></li>
                      <li>
                        <a href="blog.html">Community</a>
                        <ul class="submenu">
                          <li><a href="blog.html">Blog</a></li>
                          <li><a href="single-blog.html">Blog Details</a></li>
                        </ul>
                      </li>
                      <!-- <li><a href="#">Pages</a>
                                          <ul class="submenu">
                                              <li><a href="rooms.html">Rooms</a>
                                              <li><a href="elements.html">Element</a></li>
                                          </ul>
                                      </li>
                                      <li><a href="contact.html">Contact</a></li> -->
                    </ul>
                  </nav>
                </div>
              </div>
              <div class="col-xl-2 col-lg-2">
                <!-- header-btn -->
                <div class="header-btn">
                  <a href="login.html" class="btn btn1 d-none d-lg-block">Login / 회원가입</a>
                </div>
              </div>
              <!-- Mobile Menu -->
              <div class="col-12">
                <div class="mobile_menu d-block d-lg-none"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Header End -->
    </header>

    <div class="container">
      <div class="d-flex justify-content-center h-100">
        <div class="card">
          <div class="card-header">
            <h3>Sign In</h3>
            <div class="d-flex justify-content-end social_icon">
              <!-- <span><i class="fab fa-facebook-square"></i></span>
              <span><i class="fab fa-google-plus-square"></i></span>
              <span><i class="fab fa-twitter-square"></i></span> -->
            </div>
          </div>
          <div class="card-body">
            <form>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" placeholder="username" />
              </div>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" placeholder="password" />
              </div>
              <div class="row align-items-center remember"><input type="checkbox" />Remember Me</div>
              <div class="login">
                <input type="submit" value="Login" class="btn float-right login_btn" />

                <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=48737620c593caca588046368e70632c&redirect_uri=http://localhost:8080/myProject/index&response_type=code">
                  <img src="assets/img/logo/kakao_login_medium_narrow.png" style="display: block; margin: auto"
                /></a> -->
                <a href="mypage.html">
                  <img src="assets/img/logo/kakao_login_medium_narrow.png" style="display: block; margin: auto"
                /></a>
              </div>
            </form>
          </div>
          <div class="card-footer">
            <div class="d-flex justify-content-center links">Don't have an account?<a href="regform.jsp">Sign Up</a></div>
            <div class="d-flex justify-content-center">
              <a href="#">Forgot your password?</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
