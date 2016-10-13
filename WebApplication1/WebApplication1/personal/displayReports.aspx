<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="displayReports.aspx.cs" Inherits="WebApplication1.displayReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView class="table table-striped table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="ord_num" HeaderText="ord_num" SortExpression="ord_num" />
        <asp:BoundField DataField="stor_id" HeaderText="stor_id" SortExpression="stor_id" />
        <asp:BoundField DataField="ord_date" HeaderText="ord_date" SortExpression="ord_date" />
        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
        <asp:BoundField DataField="payterms" HeaderText="payterms" SortExpression="payterms" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubsConnectionString1 %>" SelectCommand="salesProc1" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="username" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
