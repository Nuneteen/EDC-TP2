<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Properties2.aspx.cs" Inherits="tp1.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <label>City: </label>
    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" DataSourceID="XmlDataSource1" DataTextField="City" DataValueField="City" OnLoad="DropDownList1_Load" OnSelectedIndexChanged="dropdownchange" OnTextChanged="dropdownchange">
    </asp:DropDownList>

    <br />
    
    <label>Owner: </label>
    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server" DataSourceID="XmlDataSource1" DataTextField="Owners" DataValueField="Owners" OnSelectedIndexChanged="dropdownchange" OnTextChanged="dropdownchange">
    </asp:DropDownList>

    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/properties2.xml" TransformFile="~/XSLTFile4.xslt"></asp:XmlDataSource>

    <br />

    <asp:GridView class="table table-striped table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">
        <Columns>
            <asp:BoundField DataField="land_register_number" HeaderText="land_register_number" SortExpression="land_register_number" />
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
            <asp:BoundField DataField="PortNumber" HeaderText="PortNumber" SortExpression="PortNumber" />
            <asp:BoundField DataField="Owners" HeaderText="Owners" SortExpression="Owners" />
        </Columns>
    </asp:GridView>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/properties2.xml" TransformFile="~/XSLTFile2.xslt"></asp:XmlDataSource>
</asp:Content>
