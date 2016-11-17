using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace tp1
{
    public partial class FeedReader : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string urll = DropDownList1.SelectedValue;

            if (urll.Length == 0)
            {
                urll = "http://feeds.feedburner.com/PublicoRSS?format=xml";
            }

            XmlReader reader = XmlReader.Create(urll);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();

            XmlDataSource1.Data = doc.OuterXml;
            XmlDataSource1.DataBind();
            XmlDataSource1.XPath = "/rss/channel";

            XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
            XmlElement root = xdoc.DocumentElement;
            XmlNodeList nodes = root.SelectNodes(XmlDataSource1.XPath);

            Console.WriteLine(XmlDataSource1.GetXmlDocument().Value);

            foreach (XmlNode node in nodes)
            {
                titleLabel.Text = node.Attributes[0].Value;
                linkLabel.Text = node.Attributes[1].Value;
                descriptionLabel.Text = node.Attributes[3].Value;
                languageLabel.Text = node.Attributes[2].Value;
                ManagingEditorLabel.Text = node.Attributes[4].Value;
                WebMasterLabel.Text = node.Attributes[5].Value;
                LastBuildDateLabel.Text = node.Attributes[6].Value;
                CategoryLabel.Text = node.Attributes[7].Value;

                if (node.Attributes[8].Value.Length != 0)
                {
                    Image1.Attributes["src"] = node.Attributes[8].Value;
                }
                else
                {
                    Image1.Attributes["src"] = "http://placehold.it/160x160";
                }

            }


        }


    }
}