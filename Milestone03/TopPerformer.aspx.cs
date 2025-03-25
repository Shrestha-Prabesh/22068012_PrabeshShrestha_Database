using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone03
{
	public partial class TopPerformer : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // This event handler is typically used when a row is selected in the GridView
            // Since this GridView doesn't seem to have a select column, you can leave it empty
            // or add custom logic if needed in the future
        }
    }
}