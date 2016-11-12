<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="tp1.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/cursos.xml" TransformFile="~/XSLTFile1.xslt" XPath="//curso[@grau= 'Licenciatura' and @local='Campus Universitário de Santiago, Aveiro']"></asp:XmlDataSource>

    <div class="row">
        <div class="col-sm-6"> 
            <label>Tipos: </label>
            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" DataSourceID="XmlDataSource2" DataTextField="grau" DataValueField="grau" AutoPostBack="true" OnSelectedIndexChanged="dropdownchange" OnTextChanged="dropdownchange">
            </asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/cursos.xml" TransformFile="~/XSLTFile1.xslt" XPath="/cursos/curso[not(@grau=preceding::curso/@grau)]" EnableCaching="False"></asp:XmlDataSource>
        </div>
        <div class="col-sm-6">
            <label>Locais: </label>
            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server" DataSourceID="XmlDataSource3" DataTextField="local" DataValueField="local" AutoPostBack="true" OnSelectedIndexChanged="dropdownchange" OnTextChanged="dropdownchange"></asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/cursos.xml" TransformFile="~/XSLTFile1.xslt" XPath="/cursos/curso[not(@local=preceding::curso/@local)]"></asp:XmlDataSource>
        </div>
    </div>
    <br />

    <asp:GridView class="table table-striped table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="guid" SortExpression="guid">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("guid","~/Course?ID={0}" ) %>' Text='<%# Bind("guid") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="grau" HeaderText="grau" SortExpression="grau" />
            <asp:BoundField DataField="local" HeaderText="local" SortExpression="local" />
        </Columns>
        <EmptyDataTemplate>
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">ATENÇÃO!!!</h3>
                </div>
                 <div class="panel-body">
                    Não há cursos desse tipo nesta instituição.
                </div>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>

</asp:Content>
