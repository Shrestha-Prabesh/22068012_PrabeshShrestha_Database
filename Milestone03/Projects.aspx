<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Milestone03.Projects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
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
        
        .project-form {
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
        
        .project-id {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
        }
        
        .project-status {
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
                <a class="nav-link active" href="Projects.aspx" role="tab">
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
                <a class="nav-link" href="Users.aspx" role="tab">
                    <i class="fas fa-users"></i> Users
                </a>
            </li>
        </ul>

        <div class="main-container">
            <div class="page-header">
                <h2><i class="fas fa-project-diagram me-2"></i>Project Management Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>All Projects</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-hover" BorderWidth="0px"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No projects found</div>">
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
                                                    OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                                    
                                    <asp:TemplateField HeaderText="Project ID" SortExpression="PROJECTID">
                                        <ItemTemplate>
                                            <span class="badge bg-secondary project-id"><%# Eval("PROJECTID") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Project Name" SortExpression="PROJECTNAME">
                                        <ItemTemplate>
                                            <strong><%# Eval("PROJECTNAME") %></strong>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("PROJECTNAME") %>' 
                                                CssClass="form-control form-control-sm" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Start Date" SortExpression="PROJECTSTARTDATE">
                                        <ItemTemplate>
                                            <i class="fas fa-calendar-alt me-1 text-muted"></i><%# Eval("PROJECTSTARTDATE", "{0:d}") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                                <asp:TextBox ID="TextBoxStartDate" runat="server" Text='<%# Bind("PROJECTSTARTDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="End Date" SortExpression="PROJECTENDDATE">
                                        <ItemTemplate>
                                            <i class="fas fa-calendar-check me-1 text-muted"></i><%# Eval("PROJECTENDDATE", "{0:d}") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
                                                <asp:TextBox ID="TextBoxEndDate" runat="server" Text='<%# Bind("PROJECTENDDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Status" SortExpression="PROJECTSTATUS">
                                        <ItemTemplate>
                                            <span class='badge <%# GetStatusBadgeClass(Eval("PROJECTSTATUS").ToString()) %> project-status'>
                                                <i class='fas <%# GetStatusIconClass(Eval("PROJECTSTATUS").ToString()) %> me-1'></i>
                                                <%# Eval("PROJECTSTATUS") %>
                                            </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownStatus" runat="server" CssClass="form-select form-select-sm" 
                                                SelectedValue='<%# Bind("PROJECTSTATUS") %>'>
                                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <div class="project-form">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Project</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" 
                                DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%"
                                OnPageIndexChanging="FormView1_PageIndexChanging">
                                <InsertItemTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Project ID:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' 
                                                    CssClass="form-control" placeholder="Enter project ID" TextMode="Number" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Project Name:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-clipboard"></i></span>
                                                <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' 
                                                    CssClass="form-control" placeholder="Enter project name" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Start Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                                <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' 
                                                    CssClass="form-control" placeholder="Start date" TextMode="Date" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">End Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
                                                <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' 
                                                    CssClass="form-control" placeholder="End date" TextMode="Date" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Status:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                                <asp:DropDownList ID="PROJECTSTATUSDropDown" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' 
                                                    CssClass="form-select">
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-end gap-2 mt-3">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" CssClass="btn btn-success">
                                            <i class="fas fa-save me-1"></i> Save Project
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
                                            CommandName="New" CssClass="btn btn-primary" OnClick="NewButton_Click">
                                            <i class="fas fa-plus-circle me-1"></i> Add New Project
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Project ID:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <asp:Label ID="PROJECTIDLabel1" runat="server" Text='<%# Eval("PROJECTID") %>' 
                                                    CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Project Name:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-clipboard"></i></span>
                                                <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' 
                                                    CssClass="form-control" placeholder="Enter project name" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Start Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                                <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">End Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
                                                <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Status:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                                <asp:DropDownList ID="PROJECTSTATUSDropDown" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' 
                                                    CssClass="form-select">
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-end gap-2 mt-3">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" CssClass="btn btn-success">
                                            <i class="fas fa-save me-1"></i> Update Project
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" CssClass="btn btn-outline-secondary">
                                            <i class="fas fa-times me-1"></i> Cancel
                                        </asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                    DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" 
                    InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECTSTARTDATE&quot;, &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTENDDATE&quot;, &quot;PROJECTSTATUS&quot;) VALUES (:PROJECTSTARTDATE, :PROJECTID, :PROJECTNAME, :PROJECTENDDATE, :PROJECTSTATUS)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                    SelectCommand="SELECT &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTENDDATE&quot;, &quot;PROJECTSTATUS&quot; FROM &quot;PROJECTS&quot;" 
                    UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTENDDATE&quot; = :PROJECTENDDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS WHERE &quot;PROJECTID&quot; = :PROJECTID">
                    <DeleteParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
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
        protected string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "Pending": return "bg-warning text-dark";
                case "In Progress": return "bg-primary";
                case "Completed": return "bg-success";
                default: return "bg-secondary";
            }
        }
        
        protected string GetStatusIconClass(string status)
        {
            switch (status)
            {
                case "Pending": return "fa-clock";
                case "In Progress": return "fa-spinner fa-spin";
                case "Completed": return "fa-check-circle";
                default: return "fa-question-circle";
            }
        }
    </script>
</body>
</html>