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
      <% 
    try{					        	
		Connection con=ConnectDB.connect();
		PreparedStatement ps=con.prepareStatement("select a_name,a_profile,a_bar_license,a_dob,a_mob,a_language,a_ploc,a_lat,a_lang from advocate where a_email=?");
		ps.setString(1, AdvEmail.getAdvEmail());
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			String advName=rs.getString(1);
       		byte[] imageData=rs.getBytes(2);
			String base64Image=Base64.getEncoder().encodeToString(imageData);
			String bar=rs.getString(3);
			String a_dob=rs.getString(4);
			String a_mob=rs.getString(5);
			String a_lang=rs.getString(6);
			String a_ploc=rs.getString(7);
			Double a_lat=rs.getDouble(8);
			Double a_lange=rs.getDouble(9);
			
		
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
              <a href="homepage_advocate.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
              </a>
            </li>
            <li class="menu-item active">
                <a href="complete_profile_advocate.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-user-circle"></i>
                
                  <div data-i18n="Analytics">Complete Profile</div>
                </a>
            </li>
            <li class="menu-item">
                <a href="cases_advocate.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                
                  <div data-i18n="Analytics">Cases</div>
                </a>
            </li>
            <li class="menu-item">
                <a href="user_requests_to_advocate.jsp" class="menu-link">
                    
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
                    <h5 class="mb-0 card-title text-primary">Welcome Mr.<%=advName %></h5>
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
                   <!--   <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">Settings</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                      </a>
                    </li>
                    -->
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
            <form   action="AdvCompleteProfile" method="POST" enctype="multipart/form-data" >
                <div class="card mb-4">
                    <h5 class="card-header">Profile Details</h5>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="data:image/jpeg;base64,<%=base64Image%>"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">Upload new photo</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              name="a_profile"
                             class="account-file-input"
                             id="upload"
                             hidden
                             required
                            />
                          </label>
                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">Reset</span>
                          </button>
                          <p class="text-muted mb-0">Allowed JPG,PNG</p>
                        </div>
                      </div>
                    </div>
                  <!--    <hr class="my-0" /> -->
                    <div class="card-body">
                       <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="firstName" class="form-label">Name</label>
                            <input
                              class="form-control"
                              type="text"
                              name="adv_name"
                              value="<%=advName%>"
                              placeholder="Enter Name"
                              autofocus
                              
                              required
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="lastName" class="form-label">Email</label>
                            <input class="form-control" type="text" name="advocate_email" id="advocate_email" value="<%=AdvEmail.getAdvEmail()%>" readonly/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="email" class="form-label">Mobile</label>
                            <input
                              class="form-control"
                              type="text"
                              name="adv_mob"
                              value="<%=a_mob%>"
                              placeholder="Mobile Number"
                              required
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="phoneNumber">Bar Number</label>
                            <div class="input-group input-group-merge">
                              <input
                                type="text"
                                id="advocate_bar_number"
                                name="adv_bar"
                                class="form-control"
                                placeholder="Bar Number"
                                value="<%=bar%>"
                                required
                                readonly
                              />
                            </div>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Date of Birth</label>
                            <input
                                type="date"
                                name="adv_dob"
                                class="form-control"
                                placeholder=""
                                value="<%=a_dob%>"
                                required
                              />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="address" class="form-label">Driver's License or Passport</label>
                            <input type="file" class="form-control" id="advocate_drivers_license_or_passport" name="advocate_drivers_license_or_passport" placeholder="" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">E-Signature</label>
                            <input type="file" class="form-control" id="advocate_esignature" name="advocate_esignature" placeholder="" />
                          </div>
                         
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Language</label>
                            <select name="adv_language" class="select2 form-select">
                              <option value="<%=a_lang%>>">Select</option>
                              <option value="English">English</option>
                              <option value="Hindi">Hindi</option>
                              
                            </select>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Adhar Proof</label>
                            <input type="file" class="form-control" id="advocate_adhar_proof" name="advocate_adhar_proof" placeholder="" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Certificate to Admission</label>
                            <input type="file" class="form-control" id="certification_of_admission_to_advocate" name="certification_of_admission_to_advocate" placeholder="" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Court Appointed Order</label>
                            <input type="file" class="form-control" id="court_appointed_order" name="court_appointed_order" placeholder="" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Affirmation </label>
                            <input type="file" class="form-control" id="advocate_affirmation" name="advocate_affirmation" placeholder="" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label" for="country">Practice Location</label>
                            <input type="text" class="form-control"  name="adv_ploc" placeholder="" value="<%=a_ploc %>" required/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="latitude" class="form-label">Latitude</label>
                            <input
                              type="text"
                              class="form-control"
                              name="adv_lat"
                              value="<%=a_lat %>"
                              id="advocate_late"
                              placeholder=""
                              required
                              readonly
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="langitude" class="form-label">Langitude</label>
                            <input
                              type="text"
                              class="form-control"
                              name="adv_lang"
                              value="<%=a_lange %>"
                              id="advocate_lange"
                              placeholder=""
                              required
                             readonly
                            />
                          </div>
                          <div class="mt-2">
                            <button type="button" onclick="getLocation()" class="btn btn-outline-primary me-2">Get My Location</button>
                          </div>
                          <hr style="margin: 20px 0;">
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">Save changes</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                        
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
            </div> 
             
                    <%}}catch(Exception e){
        						e.printStackTrace();
        					}%>
            <!-- / Content -->
           <script>
            const lat=document.getElementById("advocate_late");
            const lang=document.getElementById("advocate_lange");
            function getLocation() {
                if (navigator.geolocation) {
                  navigator.geolocation.getCurrentPosition(showPosition, showError);
                } else { 
                  alert("Geolocation is not supported by this browser.");
                }
              }

              function showPosition(position) {
                lat.value = position.coords.latitude; 
                lang.value = position.coords.longitude;
                console.log(lang);
                
              }

              function showError(error) {
                switch(error.code) {
                  case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.")
                    break;
                  case error.POSITION_UNAVAILABLE:
                   alert("Location information is unavailable.")
                    break;
                  case error.TIMEOUT:
                    alert("The request to get user location timed out.")
                    break;
                  case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.")
                    break;
                }
              }
           </script>

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
