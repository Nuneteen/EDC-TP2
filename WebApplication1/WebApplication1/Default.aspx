<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Engenharia de Dados e Conhecimento</h1>
        <p class="lead">Unidade curricular de programação e modelação de informação.</p>
        <p><a href="https://www.ua.pt/uc/2380" class="btn btn-primary btn-lg">Saber mais &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>TP1</h2>
            <p>
                Desenvolvimento de ASP.NET Web Forms usando bases de dados relacionais. 
                Configuração de web forms com bootstrap.
                Representação e manipulação em tabelas dos dados usando programação SQL.
                Gestão de utilizadores. Acesso a páginas com utilizadores autenticados.

            </p>
        </div>
        <div class="col-md-4">
            <h2>TP2</h2>
            <p>
                Desenvolvimento de ASP.NET Web Forms usando XML. Validação de XML com ficheiros XSD (XML Schemas). Modelação de Schemas.
                Representação e manipulação dos dados em formato XML usando XSLT, XPath, etc...
            </p>

        </div>
        <div class="col-md-4">
            <h2>TP3</h2>
            <p>
                Desenvolvimento de ASP.NET Web Forms com RSS Feed. Representação e manipulação dos dados.
            </p>
        </div>
    </div>

</asp:Content>
