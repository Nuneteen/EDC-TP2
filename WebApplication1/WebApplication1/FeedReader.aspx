<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedReader.aspx.cs" Inherits="EDC_Trabalho3.Feed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><i class="fa fa-rss fa-4"></i> My Feed Reader</h1>
    <hr />
    <div class="row">
        <asp:XmlDataSource ID="XmlDataSource_feed" TransformFile="~/App_Data/channel.xsl" runat="server" EnableCaching="false"></asp:XmlDataSource>
        <div class="col-md-6" style="text-align: left">
            <asp:DropDownList ID="feedChooser" runat="server" CssClass="form-control" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="XmlDataSourceFeedReader" DataTextField="name" DataValueField="url" OnSelectedIndexChanged="feedChooser_SelectedIndexChanged">
                <asp:ListItem Selected="True">All</asp:ListItem>
            </asp:DropDownList>
             <asp:XmlDataSource ID="XmlDataSourceFeedReader" runat="server" DataFile="~/App_Data/FeedsList.xml"></asp:XmlDataSource>
            <br />

            <div>
                  <asp:TextBox runat="server" type="text" class="col-md-6 form-group form-control" ID="ToSearch"></asp:TextBox>
                  <asp:Button runat="server" Text="Search" class="col-md-6" CssClass="btn btn-primary" OnClick="Search_New" />
            </div>

            <br />
            <div class="input-group">
                  <label>Categories</label>
                  <asp:DropDownList ID="DD_Category" runat="server" CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="col-md-6" style="text-align: right; margin-top: 0px;">
            <asp:LinkButton ID="ManageFeeds" PostBackUrl="~/manageFeeds.aspx" runat="server" CssClass="btn btn-primary"><i class="fa fa-rss"></i>&nbsp;Manage feeds</asp:LinkButton>
        </div>
        
        <div class="col-md-6" style="text-align: left; margin-top: 10px;">
            
        </div>
    </div>
    <div class="row" id="feed_info" runat="server">
        <div class="col-md-6">
            <h3>Feed Info</h3>
            <table id="table" runat="server" class="table table-striped">
                <tbody>
                <tr runat="server">
                    <th scope="row" id="titleRow" style="height: 30px">Title</th>
                    <td style="height: 30px"><asp:Label ID="titleLabel" runat="server"  /></td>
                </tr>
                <tr id="linkRow" runat="server">
                    <th scope="row">Link</th>
                    <td><asp:Label ID="linkLabel" runat="server"  /></td>
                </tr>
                <tr id="descriptionRow" runat="server">
                    <th scope="row">Description</th>
                    <td><asp:Label ID="descriptionLabel" runat="server"  /></td>
                </tr>
                <tr id="languageRow" runat="server">
                    <th scope="row">Language</th>
                    <td><asp:Label ID="languageLabel" runat="server"  /></td>
                </tr>
                <tr id="managRow" runat="server">
                    <th scope="row">ManagingEditor</th>
                    <td><asp:Label ID="ManagingEditorLabel" runat="server" /></td>
                </tr>
                <tr id="webRow" runat="server">
                    <th scope="row">WebMaster</th>
                    <td><asp:Label ID="WebMasterLabel" runat="server"  /></td>
                </tr>
                <tr id="lastRow" runat="server">
                    <th scope="row">LastBuildDate</th>
                    <td><asp:Label ID="LastBuildDateLabel" runat="server"  /></td>
                </tr>
                <tr id="categoryRow" runat="server">
                    <th scope="row">Category</th>
                    <td><asp:Label ID="CategoryLabel" runat="server" Text='' /></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-6 text-center">
            <h3>Feed Image</h3>
            <div class="row">
                <div class="col-xs-4"></div>
        		<div class="col-xs-4">
        			<img runat="server" ID="channelImage" src="http://www.freeiconspng.com/uploads/no-image-icon-23.jpg" style="width:160px" class="img-responsive img-radio">
        		</div>
                <div class="col-xs-4"></div>
        	</div>
        </div>
    </div>
        
    <hr />
    <h3>Feed News <small><asp:Label runat="server" ID="counter_news" Text="10"></asp:Label></small></h3>

    <div runat="server" ID="news" class="row"></div>

</asp:Content>