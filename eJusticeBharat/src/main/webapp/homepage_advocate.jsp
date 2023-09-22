<%@include file="files/imports.jsp"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Advocate Homepage | eJusticeBharat</title>
    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <% 
    try{					        	
		Connection con=ConnectDB.connect();
		PreparedStatement ps=con.prepareStatement("select a_name,a_profile,a_mob from advocate where a_email=?");
		ps.setString(1, AdvEmail.getAdvEmail());
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			String advName=rs.getString(1);
       		byte[] imageData=rs.getBytes(2);
			String base64Image=Base64.getEncoder().encodeToString(imageData);
			String advMob=rs.getString("a_mob");
			System.out.println(advMob);
            String advMobc=advMob+"no";
            System.out.println(advMobc);
    
	%>
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
                <img src="assets/img/logo.png" style="width: 200px;" alt="">
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="homepage_advocate.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
              </a>
            </li>
            <li class="menu-item">
                <a href="complete_profile_advocate.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-user-circle"></i>                
                  <div data-i18n="Analytics">Complete Profile</div>
                </a>
            </li>
            <li class="menu-item">
                <a href="cases_advocate.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                
                  <div data-i18n="Analytics">Cases</div>
                </a>
            </li>
            <li class="menu-item">
                <a href="user_requests_to_advocate.html" class="menu-link">
                    
                  <i class="menu-icon tf-icons bx bxs-user-check"></i>
                  <div data-i18n="Analytics">Petitioner Requests</div>
                </a>
            </li>

          
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
          class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
          id="layout-navbar"
        >
          <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
              <i class="bx bx-menu bx-sm"></i>
            </a>
          </div>

          <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            <!-- Search -->
            <div class="navbar-nav align-items-center">
              <div class="nav-item d-flex align-items-center">
                 <h5 class="mb-0 card-title text-primary">Welcome Mr. <%=advName%></h5>
              </div>
            </div>
            <!-- /Search -->
 			
            <ul class="navbar-nav flex-row align-items-center ms-auto">
              
              <!-- User -->
             
              <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                
                  <div class="avatar avatar-online">
                    <img src="data:image/jpeg;base64,<%=base64Image%>" alt class="w-px-40 h-auto rounded-circle" />
                  </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li>
                    <a class="dropdown-item" href="#">
                      <div class="d-flex">
                        <div class="flex-shrink-0 me-3">
                          <div class="avatar avatar-online">
                            <img src="data:image/jpeg;base64,<%=base64Image%>" alt class="w-px-40 h-auto rounded-circle" />
                          </div>
                        </div>
                        <div class="flex-grow-1">
                          <span class="fw-semibold d-block"><%=advName%></span>
                          <small class="text-muted">Admin</small>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <div class="dropdown-divider"></div>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">
                      <i class="bx bx-user me-2"></i>
                      <span class="align-middle">My Profile</span>
                    </a>
                  </li>
            
                  <li>
                    <div class="dropdown-divider"></div>
                  </li>
                  <li>
                    <a class="dropdown-item" href="index.html">
                      <i class="bx bx-power-off me-2"></i>
                      <span class="align-middle">Log Out</span>
                    </a>
                  </li>
                
                </ul>
              </li>
                  
                
              <!--/ User -->
            </ul>
          </div>
        </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            <%if(advMobc.equals("no")){%>
               <div class="alert alert-primary" role="alert">You Need to Complete your Profile before proceding !<br><br><button class="btn btn-primary">Complete Profile</button></div>
			      
                <%}else{%>
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary">Pretrial Meeting is Shedhuled ŸŽ‰</h5>
                          <p class="mb-4">
                            Meeting timigs are <span class="fw-bold">23 May 2023, 11.00 am</span><br/> Join 15 min prior to time.
                          </p>

                          <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Details</a>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                </div>
                </div>
                
               <%}%>
                <div class="col-lg-4 col-md-4 order-1">
                    <div class="col-lg-12 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <span>Total Cases</span>
                          <div class="d-flex" style="justify-content: space-between;">
                            <h3 class="card-title text-nowrap mb-1">36</h3>
                            <div>
                              <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28</small>
                          <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -8</small>
                            </div>
                          </div>
                          <br>
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <button class="btn btn-primary btn-md" type="button">Register a Case</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

        
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

   <%}}catch(Exception e){
        						e.printStackTrace();
        					}%>
           
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
