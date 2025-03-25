<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Milestone03.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
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
        
        .table-container {
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        
        .table th {
            background-color: #343a40;
            color: white;
        }
        
        .user-form {
            margin-top: 25px;
            border-top: 1px solid #dee2e6;
            padding-top: 20px;
        }
        
        .action-buttons .btn {
            margin-right: 5px;
        }
        
        .no-data {
            padding: 50px;
            text-align: center;
            color: #6c757d;
        }
        
        .user-id {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
        }
        
        .user-role {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
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
                <a class="nav-link" href="TopPerformer.aspx" role="tab">
                    <i class="fas fa-trophy"></i> Top Performer
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link active" href="Users.aspx" role="tab">
                    <i class="fas fa-users"></i> Users
                </a>
            </li>
        </ul>

        <div class="main-container">
            <div class="page-header">
                <h2><i class="fas fa-users me-2"></i>User Management Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-user-group me-2"></i>All Users</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="USERID" DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-hover" BorderWidth="0px"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No users found</div>">
                                <HeaderStyle CssClass="thead-dark" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" 
                                                    CssClass="btn btn-sm btn-outline-primary" ToolTip="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                                                    CssClass="btn btn-sm btn-outline-danger" ToolTip="Delete"
                                                    OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                                    <i class="fas fa-trash-alt"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                                                    CssClass="btn btn-sm btn-success" ToolTip="Save changes">
                                                    <i class="fas fa-save"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                                                    CssClass="btn btn-sm btn-secondary" ToolTip="Cancel">
                                                    <i class="fas fa-times"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="User ID" SortExpression="USERID">
                                        <ItemTemplate>
                                            <span class="badge bg-secondary user-id"><%# Eval("USERID") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Username" SortExpression="USERNAME">
                                        <ItemTemplate>
                                            <strong><%# Eval("USERNAME") %></strong>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("USERNAME") %>' 
                                                CssClass="form-control form-control-sm" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Email" SortExpression="EMAIL">
                                        <ItemTemplate>
                                            <i class="fas fa-envelope me-1 text-muted"></i><%# Eval("EMAIL") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EMAIL") %>' 
                                                    CssClass="form-control" TextMode="Email" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Contact" SortExpression="CONTACT">
                                        <ItemTemplate>
                                            <i class="fas fa-phone me-1 text-muted"></i><%# Eval("CONTACT") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CONTACT") %>' 
                                                    CssClass="form-control" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Role" SortExpression="ROLE">
                                        <ItemTemplate>
                                            <span class='badge <%# GetRoleBadgeClass(Eval("ROLE").ToString()) %> user-role'>
                                                <i class='fas <%# GetRoleIconClass(Eval("ROLE").ToString()) %> me-1'></i>
                                                <%# Eval("ROLE") %>
                                            </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownRole" runat="server" CssClass="form-select form-select-sm" 
                                                SelectedValue='<%# Bind("ROLE") %>'>
                                                <asp:ListItem Text="QA" Value="QA"></asp:ListItem>
                                                <asp:ListItem Text="Frontend Developer" Value="Frontend Developer"></asp:ListItem>
                                                <asp:ListItem Text="Backend Developer" Value="Backend Developer"></asp:ListItem>
                                                <asp:ListItem Text="Fullstack Developer" Value="Fullstack Developer"></asp:ListItem>
                                                <asp:ListItem Text="UI/UX Designer" Value="UI/UX Designer"></asp:ListItem>
                                                <asp:ListItem Text="Graphics Designer" Value="Graphics Designer"></asp:ListItem>
                                                <asp:ListItem Text="Software Engineer" Value="Software Engineer"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <div class="user-form">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="fas fa-user-plus me-2"></i>Add New User</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" 
                                DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">User ID:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' 
                                                    CssClass="form-control" placeholder="Enter user ID" TextMode="Number" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Username:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' 
                                                    CssClass="form-control" placeholder="Enter username" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Email:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' 
                                                    CssClass="form-control" placeholder="Enter email" TextMode="Email" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Contact:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' 
                                                    CssClass="form-control" placeholder="Enter contact number" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Role:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                                                <asp:DropDownList ID="ROLEDropDown" runat="server" Text='<%# Bind("ROLE") %>' 
                                                    CssClass="form-select">
                                                    <asp:ListItem Text="QA" Value="QA"></asp:ListItem>
                                                    <asp:ListItem Text="Frontend Developer" Value="Frontend Developer"></asp:ListItem>
                                                    <asp:ListItem Text="Backend Developer" Value="Backend Developer"></asp:ListItem>
                                                    <asp:ListItem Text="Fullstack Developer" Value="Fullstack Developer"></asp:ListItem>
                                                    <asp:ListItem Text="UI/UX Designer" Value="UI/UX Designer"></asp:ListItem>
                                                    <asp:ListItem Text="Graphics Designer" Value="Graphics Designer"></asp:ListItem>
                                                    <asp:ListItem Text="Software Engineer" Value="Software Engineer"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-end gap-2 mt-3">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" CssClass="btn btn-success">
                                            <i class="fas fa-save me-1"></i> Save User
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" CssClass="btn btn-outline-secondary">
                                            <i class="fas fa-times me-1"></i> Cancel
                                        </asp:LinkButton>
                                    </div>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" CssClass="btn btn-primary">
                                            <i class="fas fa-user-plus me-1"></i> Add New User
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=localhost;Persist Security Info=True;User ID=prabesh;Password=prabesh;Unicode=True" 
                    DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :USERID" 
                    InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;USERID&quot;, &quot;CONTACT&quot;, &quot;ROLE&quot;) VALUES (:USERNAME, :EMAIL, :USERID, :CONTACT, :ROLE)" 
                    ProviderName="System.Data.OracleClient" 
                    SelectCommand="SELECT &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;USERID&quot;, &quot;CONTACT&quot;, &quot;ROLE&quot; FROM &quot;USERS&quot;" 
                    UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;EMAIL&quot; = :EMAIL, &quot;CONTACT&quot; = :CONTACT, &quot;ROLE&quot; = :ROLE WHERE &quot;USERID&quot; = :USERID">
                    <DeleteParameters>
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="USERID" Type="Decimal" />
                        <asp:Parameter Name="CONTACT" Type="String" />
                        <asp:Parameter Name="ROLE" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="CONTACT" Type="String" />
                        <asp:Parameter Name="ROLE" Type="String" />
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </form>
        </div>
    </div>
    
    <!-- Bootstrap JS Bundle with Popper -->
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
            switch (role)
            {
                case "QA": return "bg-danger";
                case "Backend Developer": return "bg-warning";
                case "Frontend Developer": return "bg-primary";
                case "UI/UX Designer": return "bg-info";
                case "Software Engineer": return "bg-danger";
                case "Fullstack Developer": return "bg-warning";
                case "Graphics Designer": return "bg-primary";
                default: return "bg-secondary";
            }
        }
        
        protected string GetRoleIconClass(string role)
        {
            switch (role)
            {
                case "QA": return "fa-check-circle";
                case "Backend Developer": return "fa-server";
                case "Frontend Developer": return "fa-desktop";
                case "UI/UX Designer": return "fa-paint-brush";
                case "Software Engineer": return "fa-code";
                case "Fullstack Developer": return "fa-laptop-code";
                case "Graphics Designer": return "fa-palette";
                default: return "fa-user-tag";
            }
        }
    </script>
</body>
</html>