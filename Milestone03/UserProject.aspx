<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProject.aspx.cs" Inherits="Milestone03.UserProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Projects</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --success-color: #1cc88a;
            --info-color: #36b9cc;
            --warning-color: #f6c23e;
            --danger-color: #e74a3b;
            --dark-color: #5a5c69;
            --secondary-color: #858796;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 20px;
        }
        
        .nav-tabs {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 20px;
        }
        
        .nav-tabs .nav-link {
            border: none;
            color: var(--dark-color);
            font-weight: 500;
            padding: 0.75rem 1.25rem;
            margin-right: 5px;
            border-radius: 0.25rem 0.25rem 0 0;
            transition: all 0.3s;
        }
        
        .nav-tabs .nav-link:hover {
            border-color: transparent;
            color: var(--primary-color);
            background-color: rgba(78, 115, 223, 0.1);
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            background-color: white;
            border-bottom: 3px solid var(--primary-color);
        }
        
        .nav-tabs .nav-link i {
            margin-right: 8px;
        }
        
        .main-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 20px;
        }
        
        .page-header {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 20px;
            padding-bottom: 10px;
        }
        
        .user-selector {
            margin-bottom: 25px;
        }
        
        .table-container {
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        
        .table th {
            background-color: #343a40;
            color: white;
        }
        
        .badge-role {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
        }
        
        .no-data {
            padding: 50px;
            text-align: center;
            color: #6c757d;
        }
        
        /* Responsive adjustments */
        @media (max-width: 767.98px) {
            .container-fluid {
                padding-left: 10px;
                padding-right: 10px;
            }
            .nav-tabs .nav-link {
                padding: 0.5rem 0.75rem;
                font-size: 0.85rem;
            }
            .nav-tabs .nav-link i {
                margin-right: 5px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
       
        <!-- Navigation Tabs -->
        <ul class="nav nav-tabs" id="dashboardTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="Dashboard.aspx" role="tab">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="Projects.aspx" role="tab">
                    <i class="fas fa-project-diagram"></i> Projects
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="Tasks.aspx" role="tab">
                    <i class="fas fa-tasks"></i> Tasks
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="SubTask.aspx" role="tab">
                    <i class="fas fa-list-ul"></i> SubTasks
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="Milestones.aspx" role="tab">
                    <i class="fas fa-flag"></i> Milestones
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="ProjectMilestone.aspx" role="tab">
                    <i class="fas fa-map-marker-alt"></i> Project Milestones
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link active" href="UserProject.aspx" role="tab">
                    <i class="fas fa-user-plus"></i> User Project
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="TopPerformer.aspx" role="tab">
                    <i class="fas fa-trophy"></i> Top Performer
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="Users.aspx" role="tab">
                    <i class="fas fa-users"></i> Users
                </a>
            </li>
        </ul>

        <div class="main-container">
            <div class="page-header">
                <h2><i class="fas fa-project-diagram me-2"></i>User Project Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <div class="user-selector">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-user me-2"></i>Select User</h5>
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <label for="DropDownList1" class="form-label">Choose a user to view their projects:</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-users"></i></span>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            CssClass="form-select" 
                                            AutoPostBack="True" 
                                            DataSourceID="SqlDataSource2" 
                                            DataTextField="USERNAME" 
                                            DataValueField="USERID">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0"><i class="fas fa-list-check me-2"></i>Assigned Projects</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="USERID,PROJECTID" 
                                DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-hover"
                                BorderWidth="0"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No projects found for this user</div>">
                                <HeaderStyle CssClass="thead-dark" />
                                <Columns>
                                    <asp:TemplateField HeaderText="User">
                                        <ItemTemplate>
                                            <div class="d-flex align-items-center">
                                                <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center me-3" 
                                                    style="width: 40px; height: 40px; color: white;">
                                                    <i class="fas fa-user"></i>
                                                </div>
                                                <div>
                                                    <h6 class="mb-0"><%# Eval("USERNAME") %></h6>
                                                    <small class="text-muted">
                                                        <i class="fas fa-id-card me-1"></i>ID: <%# Eval("USERID") %>
                                                    </small>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Contact Info">
                                        <ItemTemplate>
                                            <div>
                                                <i class="fas fa-envelope me-1"></i>
                                                <%# Eval("EMAIL") %>
                                            </div>
                                            <div class="mt-1">
                                                <i class="fas fa-phone me-1"></i>
                                                <%# Eval("USERCONTACT") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Role">
                                        <ItemTemplate>
                                            <span class="badge bg-success badge-role">
                                                <i class="fas fa-user-tag me-1"></i>
                                                <%# Eval("USERROLE") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Project">
                                        <ItemTemplate>
                                            <strong><%# Eval("PROJECTNAME") %></strong>
                                            <div class="mt-1">
                                                <span class="badge bg-secondary">ID: <%# Eval("PROJECTID") %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Timeline">
                                        <ItemTemplate>
                                            <div class="mb-1">
                                                <i class="fas fa-calendar-plus text-success me-1"></i>
                                                <%# Convert.ToDateTime(Eval("PROJECTSTARTDATE")).ToString("MMM dd, yyyy") %>
                                            </div>
                                            <div>
                                                <i class="fas fa-calendar-check text-danger me-1"></i>
                                                <%# Convert.ToDateTime(Eval("PROJECTENDDATE")).ToString("MMM dd, yyyy") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-outline-secondary">
                                                    <i class="fas fa-file-export"></i>
                                                </button>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                    ProviderName="System.Data.OracleClient" 
                    SelectCommand="SELECT 
                        U.USERID,
                        U.USERNAME,
                        U.EMAIL,
                        U.ROLE AS USERROLE,
                        U.CONTACT AS USERCONTACT,
                        P.PROJECTID,
                        P.PROJECTNAME,
                        P.PROJECTSTARTDATE,
                        P.PROJECTENDDATE
                    FROM 
                        USERS U
                    JOIN 
                        USERPROJECT UP ON U.USERID = UP.USERS_USERID
                    JOIN 
                        PROJECTS P ON UP.PROJECTS_PROJECTID = P.PROJECTID
                    WHERE 
                        U.USERID = :USER_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="USER_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                    ProviderName="System.Data.OracleClient" 
                    SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                </asp:SqlDataSource>
            </form>
        </div>
    </div>
    
    <!-- Bootstrap JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Highlight current page in navigation
        document.addEventListener('DOMContentLoaded', function () {
            const currentPage = window.location.pathname.split('/').pop();
            const navLinks = document.querySelectorAll('.nav-link');

            navLinks.forEach(link => {
                if (link.getAttribute('href').includes(currentPage)) {
                    link.classList.add('active');
                }

                // Add click handler to set active state
                link.addEventListener('click', function () {
                    navLinks.forEach(nav => nav.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>