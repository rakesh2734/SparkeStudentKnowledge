<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Sparkle.home" %>
<!DOCTYPE html>
<!--<![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta charset="utf-8">
    <title>Sparkle | Online Knowledge Sharing Site</title>
    <meta name="description" content="Worthy a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/faviconsparkle.png">

    <!-- Web Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Plugins -->
    <link href="css/animations.css" rel="stylesheet">

    <!-- Worthy core CSS file -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Custom css -->
    <link href="css/custom.css" rel="stylesheet">
</head>

<body class="no-trans">
    <!-- scrollToTop -->
    <!-- ================ -->
    <div class="scrollToTop"><i class="icon-up-open-big"></i></div>

    <!-- header start -->
    <!-- ================ -->
    <header class="header fixed clearfix navbar navbar-fixed-top">
        <div class="container">
            <div class="row">
                <div class="col-md-4">

                    <!-- header-left start -->
                    <!-- ================ -->
                    <div class="header-left clearfix">
                        <!-- logo -->
                       <%-- <div class="logo smooth-scroll">
                            <a href="#banner"><img id="logo" src="http://localhost:53420/images/faviconsparkle.png" alt="Worthy"></a>
                        </div>--%>
                        <!-- name-and-slogan -->
                        <div class="site-name-and-slogan smooth-scroll">
                            <div class="site-name"><a href="#banner">Sparkle</a></div>
                            <div class="site-slogan">Online Knowledge Sharing Site</div>
                        </div>

                    </div>
                    <!-- header-left end -->

                </div>
                <div class="col-md-8">

                    <!-- header-right start -->
                    <!-- ================ -->
                    <div class="header-right clearfix">

                        <!-- main-navigation start -->
                        <!-- ================ -->
                        <div class="main-navigation animated">

                            <!-- navbar start -->
                            <!-- ================ -->
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="container-fluid">

                                    <!-- Toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>

                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
                                        <ul class="nav navbar-nav navbar-right">
                                            <li class="active"><a href="#banner">Home</a></li>
                                            <li><a href="#about">About</a></li>
                                            <li><a href="#contact">Contact</a></li>
                                             <li><a href="LoginScreen.aspx">Login</a></li>
                                            <li><a href="RegisterPage.aspx">Register</a></li>
                                        </ul>
                                    </div>

                                </div>
                            </nav>
                            <!-- navbar end -->

                        </div>
                        <!-- main-navigation end -->

                    </div>
                    <!-- header-right end -->

                </div>
            </div>
        </div>
    </header>
    <!-- header end -->
    <!-- banner start -->
    <!-- ================ -->
    <div id="banner" class="banner">
        <div class="banner-image"></div>
        <div class="banner-caption">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
                        <h1 class="text-center">Sharing is <span>Good</span></h1>
                        <p class="lead text-center">Explore the New way of Learning.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
      
    <!-- section start -->
    <!-- ================ -->
    <div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 id="about" class="title text-center" style="padding-top:-20px;">About <span>Sparkle</span></h1>
                    <p class="lead text-center">Knowledge is all about sharing.</p>
                    <div class="space"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <img height="400" width="500" src="images/elaern_new.jpg" alt="">
                            <div class="space"></div>
                        </div>
                        <div class="col-md-6">
                           <p>E-learning (or e-Learning) is the use of electronic educational technology in learning and teaching.
Information and communication technology (ICT) in education, EdTech, learning technology, multimedia learning, technology-enhanced learning (TEL), computer-based instruction (CBI), computer managed instruction, computer-based training (CBT), computer-assisted instruction or computer-aided instruction (CAI), internet-based training (IBT), flexible learning, web-based training (WBT), online education, online learning,virtual education, virtual learning environments (VLE) (which are also called learning platforms), m-learning, and digital education.In usage, all of these terms appear in articles and reviews; the term "e-learning" is used frequently, but is variously and imprecisely defined and applied.
<br />These alternative terms are all linguistically more restrictive than "educational technology" in that they refer to the use of modern tools, such as computers, digital technology, electronic media, networked digital devices and associated software and courseware with learning scenarios, worksheets and interactive exercises that facilitate learning.<br />Sparkle has diverse collection of videos related to various topics which are approved by faculty.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- section end -->
    <!-- footer start -->
    <!-- ================ -->
    <footer id="footer" style="height:767px;">
        <!-- .footer start -->
        <!-- ================ -->
        <div class="footer section" >
            <div class="container" >
                <h1 class="title text-center" id="contact">Contact Us</h1>
                <div class="space"></div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="footer-content">
                            <p class="large">Feel free to contact us</p>
                            <ul class="list-icons">
                                <li><i class="fa fa-fax pr-10"></i>+91 7416009206</li>
                                <li><i class="fa fa-envelope-o pr-10"></i>sparklethetool@gmail.com</li>
                            </ul>
                            <ul class="social-links">
                                <li class="facebook"><a target="_blank" href="https://www.facebook.com/pages/HtmlCoder/714570988650168"><i class="fa fa-facebook"></i></a></li>
                                <li class="twitter"><a target="_blank" href="https://twitter.com/HtmlcoderMe"><i class="fa fa-twitter"></i></a></li>
                                <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                                <li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
                                <li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                                <li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
                                <li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
                                <li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="footer-content">
                            <form runat="server" id="footerform">
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="name2">Name</label>
                                    <asp:TextBox runat="server" type="text" class="form-control" ID="fromuser" placeholder="Name" name="name2" required=""></asp:TextBox>
                                    <i class="fa fa-user form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="email2">Email address</label>
                                    <asp:TextBox runat="server" type="email" class="form-control" ID="frommail" placeholder="Enter email" name="email2" required=""></asp:TextBox>
                                    <i class="fa fa-envelope form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="message2">Message</label>
                                    <asp:TextBox class="form-control" runat="server" rows="8" ID="messagebody" placeholder="Message" name="message2" required=""></asp:TextBox>
                                    <i class="fa fa-pencil form-control-feedback"></i>
                                </div>
                                <asp:Button runat="server" Text="Send" OnClick="Send_EMail" class="btn btn-default"></asp:Button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .footer end -->
        <!-- .subfooter start -->
        <!-- ================ -->
        <div class="subfooter">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-center">Copyright © 2015 Sparkle.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- .subfooter end -->

    </footer>
    <!-- footer end -->
    <!-- JavaScript files placed at the end of the document so the pages load faster
    ================================================== -->
    <!-- Jquery and Bootstap core js files -->
    <script type="text/javascript" src="plugins/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Modernizr javascript -->
    <script type="text/javascript" src="plugins/modernizr.js"></script>

    <!-- Isotope javascript -->
    <script type="text/javascript" src="plugins/isotope/isotope.pkgd.min.js"></script>

    <!-- Backstretch javascript -->
    <script type="text/javascript" src="plugins/jquery.backstretch.min.js"></script>

    <!-- Appear javascript -->
    <script type="text/javascript" src="plugins/jquery.appear.js"></script>

    <!-- Initialization of Plugins -->
    <script type="text/javascript" src="js/template.js"></script>

    <!-- Custom Scripts -->
    <script type="text/javascript" src="js/custom.js"></script>

</body>
</html>

