<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Owners.aspx.cs" Inherits="tp1.Owners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label runat="server">Owners: </asp:Label>
    
    <br />
        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" DataSourceID="XmlDataSource2" DataTextField="Owners" DataValueField="Owners">
    </asp:DropDownList>

    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/properties2.xml" TransformFile="~/XSLTFile4.xslt" XPath="//owner[not(@name=preceding::owner/@name)]"></asp:XmlDataSource>

    <br />

    <asp:GridView class="table table-striped table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">
        <Columns>
            <asp:BoundField DataField="land_register_number" HeaderText="land_register_number" SortExpression="land_register_number" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        </Columns>
    </asp:GridView>


    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/properties2.xml" TransformFile="~/XSLTFile3.xslt"></asp:XmlDataSource>
</asp:Content>
