using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Xml;

namespace EDC_Trabalho3
{
    public partial class Feed : System.Web.UI.Page
    {
        Boolean repopulate = false;
         protected void Page_Load(object sender, EventArgs e)
        {
            string url = feedChooser.SelectedValue;
            if ( url == "All" || feedChooser.SelectedItem.Equals("All"))
            {
                listAll(sender, e);
                return;
            }
            if (url.Length == 0)
            {
                url = "http://feeds.feedburner.com/PublicoRSS?format=xml";
            }
            XmlReader reader = XmlReader.Create(url);
            XmlDocument doc = new XmlDocument();
            doc.Load(reader);
            reader.Close();

            XmlDataSource_feed.Data = doc.OuterXml;
            XmlDataSource_feed.DataBind();
            XmlDataSource_feed.XPath = "/rss/channel";


            XmlDocument xdoc = XmlDataSource_feed.GetXmlDocument();
            XmlElement root = xdoc.DocumentElement;
            XmlNodeList nodes = root.SelectNodes(XmlDataSource_feed.XPath);

            table.Visible = true;
            channelImage.Visible = true;

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

                if (node.Attributes[0].Value.Equals(""))
                    titleRow.Visible = false;
                if (node.Attributes[1].Value.Equals(""))
                    linkRow.Visible = false;
                if (node.Attributes[3].Value.Equals(""))
                    descriptionRow.Visible = false;
                if (node.Attributes[2].Value.Equals(""))
                    languageRow.Visible = false;
                if (node.Attributes[4].Value.Equals(""))
                    managRow.Visible = false;
                if (node.Attributes[5].Value.Equals(""))
                    webRow.Visible = false;
                if (node.Attributes[6].Value.Equals(""))
                    lastRow.Visible = false;
                if (node.Attributes[7].Value.Equals(""))
                    categoryRow.Visible = false;

                if (node.Attributes[8].Value.Length != 0)
                {
                    channelImage.Attributes["src"] = node.Attributes[8].Value;
                }
                else
                {
                    channelImage.Attributes["src"] = "http://www.freeiconspng.com/uploads/no-image-icon-23.jpg";
                }
            }
            XmlNodeList nodes_items = root.SelectNodes("/rss/channel/item");

            String innerHtml = "";

            List<String> dataSource = new List<String>();
            dataSource.Add("All");
            foreach (XmlNode node in nodes_items)
            {
                if (!dataSource.Contains(node.Attributes[3].Value))
                {
                    dataSource.Add(node.Attributes[3].Value);
                }

                // +dropdown +textbox
                if (node.Attributes[3].Value.Equals(DD_Category.SelectedValue) && (node.Attributes[1].Value.Contains(ToSearch.Text) || node.Attributes[0].Value.Contains(ToSearch.Text)))
                {
                    String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p></div></div></div></div>";
                    innerHtml += node_html;
                }

                // -dropdown -textbox
                else if (DD_Category.Text.Equals("All") && ToSearch.Text == "")
                {
                    String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p></div></div></div></div>";
                    innerHtml += node_html;
                }

                // +dropdown -textbox
                else if (node.Attributes[3].Value.Equals(DD_Category.SelectedValue) && ToSearch.Text == "")
                {
                    String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p></div></div></div></div>";
                    innerHtml += node_html;
                }

                // -dropdown +textbox
                else if (DD_Category.Text.Equals("All") && (node.Attributes[1].Value.Contains(ToSearch.Text) || node.Attributes[0].Value.Contains(ToSearch.Text)))
                {
                    String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p></div></div></div></div>";
                    innerHtml += node_html;
                }

            }
            if (!IsPostBack || repopulate)
            {
                DD_Category.DataSource = dataSource;
                DD_Category.DataBind();
                repopulate = false;
            }
            news.InnerHtml = innerHtml;

        }
        protected void Search_New(object sender, EventArgs e)
        {
            XmlDocument doc_1 = new XmlDocument();
            doc_1.Load(@"C:\Users\Nuno Silva\Documents\Visual Studio 2015\Projects\edcrepo\EDC-TP2\WebApplication1\WebApplication1\App_Data\FeedsList.xml");
            XmlNodeList elemList = doc_1.GetElementsByTagName("feed");
            String[] feeds = new String[elemList.Count];
            for (int i = 0; i < elemList.Count; i++)
            {
                feeds[i]=elemList[i].Attributes["url"].Value;
            }
            feed_info.Visible = false;
            //text_area.Visible = true;
            string findString = ToSearch.Text;
            HashSet<XmlNode> toprint = new HashSet<XmlNode>();
            //var toprint = new List<XmlNode>();
            for (int i=0; i<feeds.Length;i++)
            {
                XmlReader reader = XmlReader.Create(feeds[i]);
                XmlDocument doc_aux = new XmlDocument();
                doc_aux.Load(reader);
                reader.Close();
                //XmlNodeList aux = doc_aux.SelectNodes("/rss/channel/item//*[contains(.," + findString+")]");
                XmlNodeList aux = doc_aux.SelectNodes("/rss/channel/item");
                Boolean insert = true;
                foreach(XmlNode mynode in aux)
                {
                    XmlNodeList childs = mynode.ChildNodes;
                    foreach(XmlNode mynode_2 in childs)
                    {
                        if (mynode_2.InnerText.Contains(findString))
                        {
                            foreach(XmlNode test in toprint)
                            {
                                if (test["title"].InnerText.Equals(mynode["title"].InnerText))
                                    insert = false;
                            }
                            if (insert)
                            {
                                toprint.Add(mynode);
                                //text_area.Value += ("\n" + mynode.OuterXml.ToString());
                            }
                        }
                            
                                
                    }
                }

            }
            String innerHtml = "";
            counter_news.Text = toprint.Count.ToString();
            foreach (XmlNode node__ in toprint)
            {
                String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a style=\" color: #0f1011;text-decoration: none;font-weight: bold;\"target=\"_blank\" href=\"" + node__["link"].InnerText + "\">" + node__["title"].InnerText + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + "" + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node__["pubDate"].InnerText + "</small></div></div><p>" + node__["description"].InnerText + "</p></div></div></div></div>";
                innerHtml += node_html;
            }
            news.InnerHtml = innerHtml;
            
        }

        protected void DD_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cat = DD_Category.SelectedItem.Value;
            XmlDocument doc_1 = new XmlDocument();
            doc_1.Load(@"C:\Users\Nuno Silva\Documents\Visual Studio 2015\Projects\edcrepo\EDC-TP2\WebApplication1\WebApplication1\App_Data\FeedsList.xml");
            XmlNodeList elemList = doc_1.GetElementsByTagName("feed");
            String[] feeds = new String[elemList.Count];
            for (int i = 0; i < elemList.Count; i++)
            {
                feeds[i] = elemList[i].Attributes["url"].Value;
            }
            feed_info.Visible = false;
            HashSet<XmlNode> toprint = new HashSet<XmlNode>();
            //var toprint = new List<XmlNode>();
            for (int i = 0; i < feeds.Length; i++)
            {
                XmlReader reader = XmlReader.Create(feeds[i]);
                XmlDocument doc_aux = new XmlDocument();
                doc_aux.Load(reader);
                reader.Close();
                XmlNodeList aux = doc_aux.SelectNodes("/rss/channel/item");
                foreach (XmlNode mynode in aux)
                {
                    try
                    {
                        if (mynode["category"].InnerText.Equals(cat))
                        {
                            toprint.Add(mynode);
                        }
                    }
                    catch (Exception)
                    {
                        
                    }
                    
                }

            }
            String innerHtml = "";

            foreach (XmlNode node__ in toprint)
            {
                String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a style=\" color: #0f1011;text-decoration: none;font-weight: bold;\" target=\"_blank\" href=\"" + node__["link"].InnerText + "\">" + node__["title"].InnerText + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node__["category"].InnerText + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node__["pubDate"].InnerText + "</small></div></div><p>" + node__["description"].InnerText + "</p></div></div></div></div>";
                innerHtml += node_html;
            }
            news.InnerHtml = innerHtml;
        }
        protected void feedChooser_SelectedIndexChanged(object sender, EventArgs e)
        {
            repopulate = true;
            Page_Load(sender, e);
        }

        protected void listAll(object sender, EventArgs e)
        {
            String innerHtml = "";
            List<String> dataSource = new List<String>();
            dataSource.Add("All");
            foreach (ListItem url in feedChooser.Items)
            {
                if (url.Value == "All")
                {
                    table.Visible = false;
                    channelImage.Visible = false;
                    continue;
                }
                XmlReader reader = XmlReader.Create(url.Value);
                XmlDocument doc = new XmlDocument();
                doc.Load(reader);
                reader.Close();

                XmlDataSource_feed.Data = doc.OuterXml;
                XmlDataSource_feed.DataBind();
                XmlDataSource_feed.XPath = "/rss/channel";


                XmlDocument xdoc = XmlDataSource_feed.GetXmlDocument();
                XmlElement root = xdoc.DocumentElement;
                XmlNodeList nodes = root.SelectNodes(XmlDataSource_feed.XPath);

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

                    if (node.Attributes[0].Value == "")
                        titleRow.Visible = false;
                    if (node.Attributes[1].Value == "")
                        linkRow.Visible = false;
                    if (node.Attributes[3].Value == "")
                        descriptionRow.Visible = false;
                    if (node.Attributes[2].Value == "")
                        languageRow.Visible = false;
                    if (node.Attributes[4].Value == "")
                        managRow.Visible = false;
                    if (node.Attributes[5].Value == "")
                        webRow.Visible = false;
                    if (node.Attributes[6].Value == "")
                        lastRow.Visible = false;
                    if (node.Attributes[7].Value == "")
                        categoryRow.Visible = false;

                    if (node.Attributes[8].Value.Length != 0)
                    {
                        channelImage.Attributes["src"] = node.Attributes[8].Value;
                    }
                    else
                    {
                        channelImage.Attributes["src"] = "http://wonkville.net/wp-content/uploads/2016/04/No-image-available.jpg";
                    }

                }

                XmlNodeList nodes_items = root.SelectNodes("/rss/channel/item");

                foreach (XmlNode node in nodes_items)
                {
                    if (!dataSource.Contains(node.Attributes[3].Value))
                    {
                        dataSource.Add(node.Attributes[3].Value);
                    }

                    // +dropdown +textbox
                    if (node.Attributes[3].Value.Equals(DD_Category.SelectedValue) && (node.Attributes[1].Value.Contains(ToSearch.Text) || node.Attributes[0].Value.Contains(ToSearch.Text)))
                    {
                        String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p><div>" + url + "</div></div></div></div></div>";
                        innerHtml += node_html;
                    }

                    // -dropdown -textbox
                    else if (DD_Category.Text.Equals("All") && ToSearch.Text == "")
                    {
                        String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p><div>" + url + "</div></div></div></div></div>";
                        innerHtml += node_html;
                    }

                    // +dropdown -textbox
                    else if (node.Attributes[3].Value.Equals(DD_Category.SelectedValue) && ToSearch.Text == "")
                    {
                        String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p><div>" + url + "</div></div></div></div></div>";
                        innerHtml += node_html;
                    }

                    // -dropdown +textbox
                    else if (DD_Category.Text.Equals("All") && (node.Attributes[1].Value.Contains(ToSearch.Text) || node.Attributes[0].Value.Contains(ToSearch.Text)))
                    {
                        String node_html = "<div class=\"col-xs-12 col-md-6 col-lg-4\"><div class=\"well\" style=\"min-height: 300px\"> <div class=\"media\"> <div class=\"media-body\"> <h4 class=\"media-heading\"><a target=\"_blank\" href=\"" + node.Attributes[2].Value + "\">" + node.Attributes[0].Value + "</a></h4> <div class=\"row\"><div class=\"col-md-6\"><small><i class=\"fa fa-tag\"></i> " + node.Attributes[3].Value + "</small></div><div class=\"col-md-6\" style=\"text-align: right\"><small><i class=\"fa fa-calendar - check - o\"></i> " + node.Attributes[4].Value + "</small></div></div><p>" + node.Attributes[1].Value + "</p><div>" + url + "</div></div></div></div></div>";
                        innerHtml += node_html;
                    }

                }

            }
            if (!IsPostBack || repopulate)
            {
                DD_Category.DataSource = dataSource;
                DD_Category.DataBind();
                repopulate = false;
            }
            news.InnerHtml = innerHtml;
        }
    }
}