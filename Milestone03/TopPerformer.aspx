<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="Milestone03.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
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
        
        .project-selector {
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
        
        .task-count {
            font-size: 1.2rem;
            font-weight: bold;
            color: #198754;
        }
        
        .action-buttons .btn {
            margin-right: 5px;
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
                <a class="nav-link" href="UserProject.aspx" role="tab">
                    <i class="fas fa-user-plus"></i> User Project
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link active" href="TopPerformer.aspx" role="tab">
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
                <h2><i class="fas fa-trophy me-2"></i>Top Performers Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <div class="project-selector">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-filter me-2"></i>Filter by Project</h5>
                        </div>
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <label for="DropDownList1" class="form-label">Select a project to view top performers:</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-project-diagram"></i></span>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            CssClass="form-select" 
                                            AutoPostBack="True" 
                                            DataSourceID="SqlDataSource1" 
                                            DataTextField="PROJECTNAME" 
                                            DataValueField="PROJECTID"
                                            aria-label="Select Project">
                                            <asp:ListItem Text="All Projects" Value="0" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0"><i class="fas fa-star me-2"></i>Top Performers by Completed Tasks</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" 
                                DataSourceID="SqlDataSource2"
                                AutoGenerateColumns="False"
                                CssClass="table table-striped table-hover"
                                BorderWidth="0px"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No top performers found</div>">
                                <HeaderStyle CssClass="thead-dark" />
                                <Columns>
                                    <asp:TemplateField HeaderText="User ID">
                                        <ItemTemplate>
                                            <span class="badge bg-secondary"><%# Eval("USERID") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:BoundField DataField="USERNAME" HeaderText="Name" SortExpression="USERNAME">
                                        <ItemStyle Font-Bold="true" />
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                                    
                                    <asp:TemplateField HeaderText="Role">
                                        <ItemTemplate>
                                            <span class='badge <%# GetRoleBadgeClass(Eval("USERROLE").ToString()) %> badge-role'>
                                                <i class='fas <%# GetRoleIconClass(Eval("USERROLE").ToString()) %> me-1'></i>
                                                <%# Eval("USERROLE") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:BoundField DataField="USERCONTACT" HeaderText="Contact" SortExpression="USERCONTACT" />
                                    
                                    <asp:TemplateField HeaderText="Completed Tasks" SortExpression="COMPLETED_TASKS">
                                        <ItemTemplate>
                                            <div class="task-count">
                                                <i class="fas fa-check-circle me-1"></i>
                                                <%# Eval("COMPLETED_TASKS") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                    SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;">
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                    SelectCommand="SELECT * FROM (
    SELECT 
        U.USERID, 
        U.USERNAME, 
        U.EMAIL, 
        U.&quot;ROLE&quot; AS USERROLE, 
        U.CONTACT AS USERCONTACT, 
        COUNT(T.TASKID) AS COMPLETED_TASKS 
    FROM 
        USERS U
        JOIN USERTASK UT ON U.USERID = UT.USERS_USERID 
        JOIN TASKS T ON UT.TASKS_TASKID = T.TASKID 
        JOIN PROJECTS P ON T.PROJECTS_PROJECTID = P.PROJECTID
    WHERE 
        T.TASKSTATUS = 'Completed'
        AND (P.PROJECTID = :PROJECT_ID OR :PROJECT_ID = 0)
    GROUP BY 
        U.USERID, 
        U.USERNAME, 
        U.EMAIL, 
        U.&quot;ROLE&quot;, 
        U.CONTACT 
    ORDER BY 
        COMPLETED_TASKS DESC
) WHERE ROWNUM <= 3">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
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
    
    <script runat="server">
        protected string GetRoleBadgeClass(string role)
        {
            switch (role.ToLower())
            {
                case "admin": return "bg-danger";
                case "manager": return "bg-primary";
                case "developer": return "bg-success";
                case "designer": return "bg-warning";
                default: return "bg-info";
            }
        }
        
        protected string GetRoleIconClass(string role)
        {
            switch (role.ToLower())
            {
                case "admin": return "fa-user-shield";
                case "manager": return "fa-user-tie";
                case "developer": return "fa-code";
                case "designer": return "fa-paint-brush";
                default: return "fa-user";
            }
        }
    </script>
</body>
</html>