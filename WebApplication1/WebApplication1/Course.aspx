<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="tp1.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" style="font-size: large">Informação sobre o curso</asp:Label>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/cursos.xml" TransformFile="~/cursodetalhes.xsl"></asp:XmlDataSource>
    <asp:DetailsView GridLines="None" FieldHeaderStyle-Width="45" CssClass="table table-condensed table-hover" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="XmlDataSource1" Height="200px" OnInit="DetailsView1_Init">
            <FieldHeaderStyle Width="10%" Font-Bold="true"/>
            <Fields>
                <asp:BoundField DataField="guid" HeaderText="GUID" SortExpression="guid" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
                <asp:BoundField DataField="grau" HeaderText="Grau" SortExpression="grau" />
                <asp:BoundField DataField="vagas" HeaderText="Vagas" SortExpression="vagas" />
                <asp:BoundField DataField="saidas_profissionais" HeaderText="Saídas Profissionais" HtmlEncode="False" SortExpression="saidas_profissionais" />
                <asp:BoundField DataField="media_1a" HeaderText="Média (1ª Fase)" SortExpression="media_1a" />
                <asp:BoundField DataField="media_2a" HeaderText="Média (2ª Fase)" SortExpression="media_2a" />
                <asp:BoundField DataField="duracao" HeaderText="Druação" SortExpression="duracao" />
                <asp:BoundField DataField="provas" HeaderText="Provas" HtmlEncode="False" SortExpression="provas" />
            </Fields>
        </asp:DetailsView>
</asp:Content>
