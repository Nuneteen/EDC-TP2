<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedReader.aspx.cs" Inherits="tp1.FeedReader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server">
        <h1>
            <i class="fa fa-rss" aria-hidden="true"></i>
            My Feed Reader
        </h1>
    </asp:Label>

    <hr />

    <div class="w3-row-padding">

        <div class="w3-twothird w3-container">
            
            <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
            </asp:DropDownList>
            
            <asp:Label ID="Label3" runat="server">
                <h2>Feed Info</h2>
            </asp:Label>

            <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>

            <table class="table table-striped">
                <tbody>
                <tr>
                    <th scope="row">Title</th>
                    <td><asp:Label ID="titleLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">Link</th>
                    <td><asp:Label ID="linkLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">Description</th>
                    <td><asp:Label ID="descriptionLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">Language</th>
                    <td><asp:Label ID="languageLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">ManagingEditor</th>
                    <td><asp:Label ID="ManagingEditorLabel" runat="server" /></td>
                </tr>
                <tr>
                    <th scope="row">WebMaster</th>
                    <td><asp:Label ID="WebMasterLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">LastBuildDate</th>
                    <td><asp:Label ID="LastBuildDateLabel" runat="server"  /></td>
                </tr>
                <tr>
                    <th scope="row">Category</th>
                    <td><asp:Label ID="CategoryLabel" runat="server" Text='' /></td>
                </tr>
                </tbody>
            </table>
            
        </div>

        <div class="w3-third w3-container">

            <asp:LinkButton ID="LinkButton1" class="btn btn-primary" runat="server"><i class="fa fa-rss" aria-hidden="true"></i> Manage Feeds</asp:LinkButton>

            <asp:Label ID="Label2" runat="server" >
                <h2> Feed Image </h2>
            </asp:Label>
            
            <asp:Image ID="Image1" runat="server" />

        </div>

    </div>
</asp:Content>
