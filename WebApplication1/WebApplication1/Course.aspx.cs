using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp1
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_Init(object sender, EventArgs e)
        {
            this.XmlDataSource1.DataFile = "http://acesso.ua.pt/xml/curso.asp?i=" + Request["ID"];
        }
    }
}