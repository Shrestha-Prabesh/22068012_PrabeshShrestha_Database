<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestones.aspx.cs" Inherits="Milestone03.Milestones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
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
        
        .milestone-form {
            margin-top: 25px;
            border-top: 1px solid #dee2e6;
            padding-top: 20px;
        }
        
        .milestone-status {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
        }
        
        .action-buttons .btn {
            margin-right: 5px;
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
                <a class="nav-link active" href="Milestones.aspx" role="tab">
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
                <h2><i class="fas fa-flag-checkered me-2"></i>Milestone Management Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>Milestones List</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="MILESTONEID" 
                                DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-hover"
                                BorderWidth="0px"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No milestones found</div>">
                                <HeaderStyle CssClass="thead-dark" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" 
                                                    OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                                    <i class="fas fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success">
                                                    <i class="fas fa-check"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">
                                                    <i class="fas fa-times"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Milestone ID" SortExpression="MILESTONEID">
                                        <ItemTemplate>
                                            <span class="badge bg-secondary"><%# Eval("MILESTONEID") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Milestone Name" SortExpression="MILESTONENAME">
                                        <ItemTemplate>
                                            <strong><%# Eval("MILESTONENAME") %></strong>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control form-control-sm" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Due Date" SortExpression="MILESTONEDUEDATE">
                                        <ItemTemplate>
                                            <div>
                                                <i class="fas fa-calendar-day text-danger me-1"></i>
                                                <%# Eval("MILESTONEDUEDATE", "{0:MMM dd, yyyy}") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div>
                                                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control form-control-sm" TextMode="Date" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Status" SortExpression="MILESTONESTATUS">
                                        <ItemTemplate>
                                            <span class='badge <%# GetStatusBadgeClass(Eval("MILESTONESTATUS").ToString()) %> milestone-status'>
                                                <i class='fas <%# GetStatusIconClass(Eval("MILESTONESTATUS").ToString()) %> me-1'></i>
                                                <%# Eval("MILESTONESTATUS") %>
                                            </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="MILESTONESTATUSDropDown" runat="server" CssClass="form-select form-select-sm" 
                                                SelectedValue='<%# Bind("MILESTONESTATUS") %>'>
                                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                                <asp:ListItem Text="Pending" Value="On Hold"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Project Name">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("Projects_ProjectId") %>' CssClass="form-select form-select-sm">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTID&quot; || '_'|| &quot;PROJECTNAME&quot; AS &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                                            <br />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-project-diagram"></i></span>
                                                <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("Projects_ProjectId") %>' CssClass="form-select form-select-sm">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTID&quot; || '_'|| &quot;PROJECTNAME&quot; AS &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <div class="milestone-form">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Milestone</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" 
                                DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Milestone ID:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' 
                                                    CssClass="form-control" placeholder="Enter milestone ID" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Milestone Name:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-flag"></i></span>
                                                <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' 
                                                    CssClass="form-control" placeholder="Enter milestone name" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Due Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-day"></i></span>
                                                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Status:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-info-circle"></i></span>
                                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
                                                    DataTextField="MILESTONESTATUS" DataValueField="MILESTONESTATUS" 
                                                    SelectedValue='<%# Bind("MILESTONESTATUS") %>'
                                                    CssClass="form-select">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                                                    ProviderName="System.Data.OracleClient" 
                                                    SelectCommand="SELECT DISTINCT &quot;MILESTONESTATUS&quot; FROM &quot;MILESTONES&quot;">
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Project:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-project-diagram"></i></span>
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
                                                    DataTextField="PROJECTNAME" DataValueField="PROJECTID" 
                                                    SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>'
                                                    CssClass="form-select">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                                                    ProviderName="System.Data.OracleClient" 
                                                    SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;">
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-end gap-2 mt-3">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                            CssClass="btn btn-success">
                                            <i class="fas fa-save me-1"></i> Save Milestone
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                            CssClass="btn btn-outline-secondary">
                                            <i class="fas fa-times me-1"></i> Cancel
                                        </asp:LinkButton>
                                    </div>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                            CssClass="btn btn-primary">
                                            <i class="fas fa-plus-circle me-1"></i> Create New Milestone
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                    DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" 
                    InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;MILESTONESTATUS&quot;, &quot;PROJECTS_PROJECTID&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONEDUEDATE, :MILESTONESTATUS, :PROJECTS_PROJECTID)" 
                    ProviderName="System.Data.OracleClient" 
                    SelectCommand="SELECT * FROM &quot;MILESTONES&quot;" 
                    UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, &quot;MILESTONESTATUS&quot; = :MILESTONESTATUS, &quot;PROJECTS_PROJECTID&quot; = :PROJECTS_PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
                    <DeleteParameters>
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONENAME" Type="String" />
                        <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                        <asp:Parameter Name="MILESTONESTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MILESTONENAME" Type="String" />
                        <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                        <asp:Parameter Name="MILESTONESTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
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
                case "In Progress": return "bg-primary";
                case "Completed": return "bg-success";
                case "Pending": return "bg-warning";
                default: return "bg-info";
            }
        }
        
        protected string GetStatusIconClass(string status)
        {
            switch (status)
            {
                case "In Progress": return "fa-spinner";
                case "Completed": return "fa-check-circle";
                case "Pending": return "fa-pause-circle";
                default: return "fa-info-circle";
            }
        }
    </script>
</body>
</html>