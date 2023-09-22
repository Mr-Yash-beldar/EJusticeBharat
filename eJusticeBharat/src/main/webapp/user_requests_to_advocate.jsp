	<%@include file="files/imports.jsp" %>
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
			String advMobc=advMob+"no";
            
    
	%>
    <!-- Layout wrapper -->
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
            <li class="menu-item">
              <a href="homepage_advocate.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
              </a>
            </li>
            <li class="menu-item">
                <a href="complete_profile_advocate.html" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-user-circle"></i>
                
                  <div data-i18n="Analytics">Complete Profile</div>
                </a>
            </li>
            <li class="menu-item active">
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
                    <h4 class="mb-0">Welcome Mr. <%=advName%></h4>
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
                            <span class="fw-semibold d-block"><%=advName %></span>
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
                      <a class="dropdown-item" href="auth-login-basic.html">
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
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <button type="button" class="btn btn-primary">Search</button>

               
              </ul>
            </div>
          </nav>
          
   <%}}catch(Exception e){
        						e.printStackTrace();
        					}%>

            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
            <!-- Striped Rows -->
            <div class="card">
                <div class="table-responsive text-nowrap">
                 <% try{					        	
						Connection con=ConnectDB.connect();
						PreparedStatement ps=con.prepareStatement("select req_id,req_uname,req_type,req_title,request_desc, req_adv_status from request where req_adv_email=? order by req_adv_status desc");
						ps.setString(1, AdvEmail.getAdvEmail());
						ResultSet rs=ps.executeQuery();
						if(!rs.isBeforeFirst()){
					%>
					<div class="alert alert-primary" role="alert">You don't have any Case <br><br><a href="user_requests_to_advocate.jsp"><button class="btn btn-primary" >See Requests</button></a></div>
			  		<%} else{ int count =1;
			  		%>
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Sr no</th>
                        <th>Name</th>
                        <th>Case Type</th>
                        <th>Case Matter</th>
                        <th>Status</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <%while(rs.next()){ %>
                     <tr>
                        <td><%=count %></td>
                        <td><%=rs.getString("req_uname")%></td>
                        <td><%=rs.getString("req_type")%></td>
                        <td>
                            <button
                            type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#fullscreenModal"
                          >
                            View Case
                          </button>
  
                          <!-- Modal -->
                          <div class="modal fade" id="fullscreenModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="modalFullTitle"><%=rs.getString("req_title")%></h5>
                                  <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                  ></button>
                                </div>
                                <div class="modal-body">
                                  <p>
                                    <%=rs.getString("request_desc")%>
                                  </p>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                    Close
                                  </button>
                                  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <% if(rs.getString("req_adv_status").equals("Approve")){%>
                        <td><span class="badge bg-label-success me-1">Accepted</span></td>
                        <%} else{ %>
                         <td><span class="badge bg-label-warning me-1">Pending</span></td>
                         <%} %>
                        <td>
                            <div class="dropdown">
                              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="ApproveUserRequest.jsp?id=<%=rs.getInt("req_id")%>"
                                  >Approve</a
                                >
                                <a class="dropdown-item" href="RejectUserRequest.jsp?id=<%=rs.getInt("req_id")%>"
                                  >Reject</a
                                >
                              </div>
                            </div>
                          </td>
                      </tr>
                      <%count++;}%>
                    </tbody>
                  </table>
                  <%} %>
                </div>
              </div>
              <!--/ Striped Rows -->
            </div>
                  
   <%}catch(Exception e){
        						e.printStackTrace();
        					}%>
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
