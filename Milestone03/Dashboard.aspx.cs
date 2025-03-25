using System;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;

namespace Milestone03
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjectStatistics();
            }
        }

        private void LoadProjectStatistics()
        {
            // Get your connection string - replace with actual connection string name
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString4"].ConnectionString;

            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Get total projects count
                    using (OracleCommand cmdTotal = new OracleCommand("SELECT COUNT(*) FROM PROJECTS", connection))
                    {
                        int totalProjects = Convert.ToInt32(cmdTotal.ExecuteScalar());
                        litTotalProjects.Text = totalProjects.ToString();
                    }

                    // Get pending projects count
                    using (OracleCommand cmdPending = new OracleCommand("SELECT COUNT(*) FROM PROJECTS WHERE PROJECTSTATUS = 'Pending'", connection))
                    {
                        int pendingProjects = Convert.ToInt32(cmdPending.ExecuteScalar());
                        litPendingProjects.Text = pendingProjects.ToString();
                    }

                    // Get in progress projects count
                    using (OracleCommand cmdInProgress = new OracleCommand("SELECT COUNT(*) FROM PROJECTS WHERE PROJECTSTATUS = 'In Progress'", connection))
                    {
                        int inProgressProjects = Convert.ToInt32(cmdInProgress.ExecuteScalar());
                        litInProgressProjects.Text = inProgressProjects.ToString();
                    }

                    // Get completed projects count
                    using (OracleCommand cmdComplete