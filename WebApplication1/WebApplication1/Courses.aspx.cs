using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace tp1
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void dropdownchange(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "//curso[@grau= '" + DropDownList1.SelectedValue + "' and @local='" + DropDownList2.SelectedValue + "']";
            XmlDataSource1.EnableCaching = false;
            GridView1.DataBind();
            XmlDataSource1.EnableCaching = true;
        }

    }
}