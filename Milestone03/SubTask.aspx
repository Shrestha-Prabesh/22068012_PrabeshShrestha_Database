<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubTask.aspx.cs" Inherits="Milestone03.SubTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Management</title>
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
        
        .subtask-form {
            margin-top: 25px;
            border-top: 1px solid #dee2e6;
            padding-top: 20px;
        }
        
        .subtask-status {
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
        
        .input-group-text {
            min-width: 40px;
            justify-content: center;
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
                <a class="nav-link active" href="SubTask.aspx" role="tab">
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
                <h2><i class="fas fa-list-check me-2"></i>Subtask Management Dashboard</h2>
            </div>
            
            <form id="form1" runat="server">
                <!-- Rest of your existing form content remains exactly the same -->
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-clipboard-list me-2"></i>Subtasks List</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-container">
                            <asp:GridView ID="GridView1" runat="server" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="SUBTASKID" 
                                DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-hover"
                                BorderWidth="0px"
                                EmptyDataText="<div class='no-data'><i class='fas fa-info-circle fa-3x mb-3'></i><br>No subtasks found</div>">
                                <HeaderStyle CssClass="thead-dark" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger" 
                                                    OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
                                    
                                    <asp:TemplateField HeaderText="Subtask ID" SortExpression="SUBTASKID">
                                        <ItemTemplate>
                                            <span class="badge bg-secondary"><%# Eval("SUBTASKID") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Subtask Name" SortExpression="SUBTASKNAME">
                                        <ItemTemplate>
                                            <strong><%# Eval("SUBTASKNAME") %></strong>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="SubtaskNameTextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control form-control-sm" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Timeline" SortExpression="SUBTASKSTARTDATE">
                                        <ItemTemplate>
                                            <div class="mb-1">
                                                <i class="fas fa-calendar-plus text-success me-1"></i>
                                                <%# Eval("SUBTASKSTARTDATE", "{0:MMM dd, yyyy}") %>
                                            </div>
                                            <div>
                                                <i class="fas fa-calendar-check text-danger me-1"></i>
                                                <%# Eval("SUBTASKENDDATE", "{0:MMM dd, yyyy}") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="mb-2">
                                                <label class="form-label small">Start Date:</label>
                                                <asp:TextBox ID="SubtaskStartDateTextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control form-control-sm" TextMode="Date" />
                                            </div>
                                            <div>
                                                <label class="form-label small">End Date:</label>
                                                <asp:TextBox ID="SubtaskEndDateTextBox" runat="server" Text='<%# Bind("SUBTASKENDDATE", "{0:yyyy-MM-dd}") %>' 
                                                    CssClass="form-control form-control-sm" TextMode="Date" />
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Status" SortExpression="SUBTASKSTATUS">
                                        <ItemTemplate>
                                            <span class='badge <%# GetStatusBadgeClass(Eval("SUBTASKSTATUS").ToString()) %> subtask-status'>
                                                <i class='fas <%# GetStatusIconClass(Eval("SUBTASKSTATUS").ToString()) %> me-1'></i>
                                                <%# Eval("SUBTASKSTATUS") %>
                                            </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownStatus" runat="server" CssClass="form-select form-select-sm" 
                                                SelectedValue='<%# Bind("SUBTASKSTATUS") %>'>
                                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Assigned User">
                                        <ItemTemplate>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" 
                                                    SelectedValue='<%# Bind("USERS_USERID") %>'
                                                    CssClass="form-select form-select-sm">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERID&quot; || '_' || &quot;USERNAME&quot; AS &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" 
                                                    SelectedValue='<%# Bind("USERS_USERID") %>'
                                                    CssClass="form-select form-select-sm">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERID&quot; || '_' || &quot;USERNAME&quot; AS &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                                            </asp:SqlDataSource>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Parent Task">
                                        <ItemTemplate>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                                <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataSource4" DataTextField="TASKNAME" DataValueField="TASKID" 
                                                    SelectedValue='<%# Bind("TASKS_TASKID") %>'
                                                    CssClass="form-select form-select-sm">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKID&quot; || '_' || &quot;TASKNAME&quot; AS &quot;TASKNAME&quot; FROM &quot;TASKS&quot;">
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                                                    DataSourceID="SqlDataSource4" DataTextField="TASKNAME" DataValueField="TASKID" 
                                                    SelectedValue='<%# Bind("TASKS_TASKID") %>'
                                                    CssClass="form-select form-select-sm">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKID&quot; || '_' || &quot;TASKNAME&quot; AS &quot;TASKNAME&quot; FROM &quot;TASKS&quot;">
                                            </asp:SqlDataSource>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
                <div class="subtask-form">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Subtask</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" 
                                DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Subtask ID:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' 
                                                    CssClass="form-control" placeholder="Enter subtask ID" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Subtask Name:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-clipboard-list"></i></span>
                                                <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' 
                                                    CssClass="form-control" placeholder="Enter subtask name" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Start Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-plus"></i></span>
                                                <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">End Date:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
                                                <asp:TextBox ID="SUBTASKENDDATETextBox" runat="server" Text='<%# Bind("SUBTASKENDDATE") %>' 
                                                    CssClass="form-control" TextMode="Date" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">Status:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-info-circle"></i></span>
                                                <asp:DropDownList ID="SUBTASKSTATUSDropDown" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' 
                                                    CssClass="form-select">
                                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">Assigned User:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
                                                    DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>'
                                                    CssClass="form-select">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                    SelectCommand="SELECT &quot;USERID&quot;, &quot;USERID&quot; || '_' || &quot;USERNAME&quot; AS &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3">
                                            <label class="form-label">Parent Task:</label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" 
                                                    DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKS_TASKID") %>'
                                                    CssClass="form-select">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                                    ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                                    SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKID&quot; || '_' || &quot;TASKNAME&quot; AS &quot;TASKNAME&quot; FROM &quot;TASKS&quot;">
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-end gap-2 mt-3">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                            CssClass="btn btn-success">
                                            <i class="fas fa-save me-1"></i> Save Subtask
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
                                            <i class="fas fa-plus-circle me-1"></i> Create New Subtask
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=localhost;User ID=prabesh;Password=prabesh;Unicode=True" 
                    DeleteCommand="DELETE FROM &quot;SUB_TASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" 
                    InsertCommand="INSERT INTO &quot;SUB_TASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKENDDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;USERS_USERID&quot;, &quot;TASKS_TASKID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKENDDATE, :SUBTASKSTATUS, :USERS_USERID, :TASKS_TASKID)" 
                    ProviderName="System.Data.OracleClient" 
                    SelectCommand="SELECT * FROM &quot;SUB_TASK&quot;" 
                    UpdateCommand="UPDATE &quot;SUB_TASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKENDDATE&quot; = :SUBTASKENDDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;USERS_USERID&quot; = :USERS_USERID, &quot;TASKS_TASKID&quot; = :TASKS_TASKID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                    <DeleteParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="SUBTASKENDDATE" Type="DateTime" />
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                        <asp:Parameter Name="TASKS_TASKID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="SUBTASKENDDATE" Type="DateTime" />
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                        <asp:Parameter Name="TASKS_TASKID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </UpdateParameters>
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