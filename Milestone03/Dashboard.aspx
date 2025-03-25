<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Management Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            height: 100%;
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .chart-container {
            background: white;
            border-radius: 0.35rem;
            padding: 20px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 30px;
            height: 100%;
        }
        
        .chart-title {
            text-align: center;
            margin-bottom: 15px;
            color: var(--dark-color);
            font-weight: 600;
            font-size: 1.1rem;
        }
        
        .chart-wrapper {
            width: 100%;
            position: relative;
            overflow: hidden;
        }
        
        .first-row-chart {
            height: 300px;
        }
        
        .second-row-chart {
            height: 450px;
        }
        
        .chart-center-container {
            display: flex;
            justify-content: center;
            width: 100%;
            overflow-x: auto;
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
            .second-row-chart {
                height: 400px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 px-md-4 py-4">
                    <!-- Dashboard Header -->
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Project Management Dashboard</h1>
                    </div>

                    <!-- Navigation Tabs -->
                    <ul class="nav nav-tabs" id="dashboardTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" href="Dashboard.aspx" role="tab">
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
                            <a class="nav-link" href="Users.aspx" role="tab">
                                <i class="fas fa-users"></i> Users
                            </a>
                        </li>
                    </ul>

                    <!-- First Row - Donut and Pie Charts -->
                    <div class="row g-3 mb-4">
                        <!-- Project Status Donut Chart -->
                        <div class="col-12 col-lg-6">
                            <div class="card shadow-sm">
                                <div class="chart-container">
                                    <div class="chart-wrapper first-row-chart">
                                        <asp:Chart ID="Chart1" runat="server" DataSourceID="DonutChart" Width="500px" Height="300px">
                                            <Series>
                                                <asp:Series Name="Series1" ChartType="Doughnut" 
                                                    XValueMember="PROJECTSTATUS" YValueMembers="PROJECT_COUNT"
                                                    CustomProperties="DoughnutRadius=25, PieLabelStyle=Disabled, PieDrawingStyle=SoftEdge"
                                                    Palette="Pastel">
                                                    <Points>
                                                        <asp:DataPoint Color="#1cc88a" LegendText="Completed" />
                                                        <asp:DataPoint Color="#f6c23e" LegendText="In Progress" />
                                                        <asp:DataPoint Color="#e74a3b" LegendText="Not Started" />
                                                        <asp:DataPoint Color="#36b9cc" LegendText="On Hold" />
                                                    </Points>
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                                    <Area3DStyle Enable3D="true" Inclination="30" />
                                                </asp:ChartArea>
                                            </ChartAreas>
                                            <Legends>
                                                <asp:Legend Name="Legend1" Docking="Bottom" Alignment="Center" 
                                                    LegendStyle="Row" TableStyle="Auto" IsTextAutoFit="true" />
                                            </Legends>
                                            <Titles>
                                                <asp:Title Text="Project Distribution by Status" Font="Segoe UI, 12pt, style=Bold" ForeColor="#5a5c69" />
                                            </Titles>
                                        </asp:Chart>
                                    </div>
                                    <asp:SqlDataSource ID="DonutChart" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                        SelectCommand="SELECT PROJECTSTATUS, COUNT(*) AS PROJECT_COUNT FROM PROJECTS GROUP BY PROJECTSTATUS">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <!-- Team Composition Pie Chart -->
                        <div class="col-12 col-lg-6">
                            <div class="card shadow-sm">
                                <div class="chart-container">
                                    <div class="chart-wrapper first-row-chart">
                                        <asp:Chart ID="Chart3" runat="server" DataSourceID="PieChart" Width="500px" Height="300px">
                                            <Series>
                                                <asp:Series Name="Series1" ChartType="Pie" 
                                                    XValueMember="ROLE" YValueMembers="COUNT"
                                                    CustomProperties="PieLabelStyle=Outside, PieDrawingStyle=Concave, LabelsRadialLineSize=1"
                                                    Palette="BrightPastel">
                                                    <Points>
                                                        <asp:DataPoint Color="#4e73df" LegendText="Developer" />
                                                        <asp:DataPoint Color="#1cc88a" LegendText="Manager" />
                                                        <asp:DataPoint Color="#f6c23e" LegendText="QA" />
                                                        <asp:DataPoint Color="#e74a3b" LegendText="Designer" />
                                                    </Points>
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                                    <Area3DStyle Enable3D="true" LightStyle="Realistic" />
                                                </asp:ChartArea>
                                            </ChartAreas>
                                            <Legends>
                                                <asp:Legend Name="Legend1" Docking="Right" 
                                                    LegendStyle="Column" IsTextAutoFit="true" />
                                            </Legends>
                                            <Titles>
                                                <asp:Title Text="User Distribution by Role" Font="Segoe UI, 12pt, style=Bold" ForeColor="#5a5c69" />
                                            </Titles>
                                        </asp:Chart>
                                    </div>
                                    <asp:SqlDataSource ID="PieChart" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                        SelectCommand="SELECT ROLE, COUNT(*) as count FROM USERS GROUP BY ROLE">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Second Row - Bar Chart -->
                    <div class="row g-3">
                        <div class="col-12">
                            <div class="card shadow-sm">
                                <div class="chart-container">
                                    <div class="chart-wrapper second-row-chart">
                                        <div class="chart-center-container">
                                            <asp:Chart ID="Chart4" runat="server" DataSourceID="Barchart" Width="1100px" Height="450px">
                                                <Series>
                                                    <asp:Series Name="Series1" ChartType="Bar" 
                                                        XValueMember="PROJECTNAME" YValueMembers="TASK_COUNT"
                                                        Color="#4e73df" 
                                                        CustomProperties="DrawingStyle=Cylinder, PointWidth=0.6, LabelStyle=Top"
                                                        IsValueShownAsLabel="True">
                                                        <EmptyPointStyle CustomProperties="PointWidth=0.6" />
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackColor="WhiteSmoke">
                                                        <AxisY LineColor="DimGray" Title="Number of Tasks" TitleFont="Segoe UI, 10pt, style=Bold">
                                                            <MajorGrid LineColor="LightGray" />
                                                            <LabelStyle Font="Segoe UI, 9pt" />
                                                        </AxisY>
                                                        <AxisX LineColor="DimGray" Title="Projects" TitleFont="Segoe UI, 10pt, style=Bold">
                                                            <MajorGrid Enabled="false" />
                                                            <LabelStyle Angle="-45" Font="Segoe UI, 9pt" />
                                                        </AxisX>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Legends>
                                                    <asp:Legend Name="Legend1" Enabled="False" />
                                                </Legends>
                                                <Titles>
                                                    <asp:Title Text="Top 5 Projects with the Most Tasks" Font="Segoe UI, 14pt, style=Bold" ForeColor="#5a5c69" />
                                                </Titles>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                        </div>
                                    </div>
                                    <asp:SqlDataSource ID="Barchart" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                                        SelectCommand="SELECT PROJECTNAME, TASK_COUNT 
FROM (
    SELECT p.PROJECTNAME, COUNT(t.TASKID) AS TASK_COUNT 
    FROM PROJECTS p 
    LEFT JOIN TASKS t ON p.PROJECTID = t.PROJECTS_PROJECTID 
    GROUP BY p.PROJECTNAME 
    ORDER BY TASK_COUNT DESC
) WHERE ROWNUM &lt;= 5">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
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