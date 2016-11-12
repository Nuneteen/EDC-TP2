using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace tp1
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void dropdownchange(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "//property[owner/@name= '" + DropDownList2.SelectedValue + "' and address/@City='" + DropDownList1.SelectedValue + "']";
            XmlDataSource1.EnableCaching = false;
            GridView1.DataBind();
            XmlDataSource1.EnableCaching = true;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void DropDownList1_Load(object sender, EventArgs e)
        {

        }

      
    }
}