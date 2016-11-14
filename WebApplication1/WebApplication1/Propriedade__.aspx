﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Propriedade__.aspx.cs" Inherits="Pratical_Work2.Propriedade__" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Propriedades</h2>

    <div class="row">
        <div class="col-md-6 text-left">
            Cidades: <asp:DropDownList class="form-control" runat="server" AppendDataBoundItems="true"  AutoPostBack="True" ID="Cidades" DataSourceID="XmlDataSource2" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged" Width="150px" >
                                                        <asp:ListItem Value="Todos" Selected="True">Todos</asp:ListItem>
                                                  </asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/PropertiesData.xml" TransformFile="~/App_Data/properties.xsl" XPath="properties/property[not(@city=preceding::property/@city)]"></asp:XmlDataSource>
        </div>
    </div>
     <div class="row" style="margin-top:40px">
        <div class="col-md-4 text-left">
                <div class="input-group">
                  <asp:TextBox runat="server" class="form-control" ID="tax_number"></asp:TextBox>
                  <span class="input-group-btn">
                    <asp:Button runat="server" Text="Procurar" CssClass="btn btn-primary btn-sm" OnClick="Search_Owner" />
                  </span>
                </div>
        </div>
    </div>
    <div class="row" style="margin-top: 40px">
        <div class="col-md-6 text-left">
        </div>
    </div>
    <asp:GridView ID="GridView1" onrowupdating="propertyItemUpdating" OnRowDeleting="propertyItemDeleting" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="XmlDataSource1" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="Land Register">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("land_register", "proprietario.aspx?ID={0}") %>' Text='<%# Eval("land_register") %>'></asp:HyperLink>
                </ItemTemplate>
                <FooterTemplate> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="city">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate> 
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Street" SortExpression="street">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("street") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate> 
                    <asp:TextBox ID="txtstreet" runat="server"></asp:TextBox> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Port Number" SortExpression="port_number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("port_number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("port_number") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate> 
                    <asp:TextBox ID="txtport" runat="server"></asp:TextBox> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value" SortExpression="value">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("value") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("value") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate> 
                    <asp:TextBox ID="txtvalue" runat="server"></asp:TextBox> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" class="fa fa-floppy-o"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" class="fa fa-times"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate> 
                    <asp:LinkButton ID="lnkSave" runat="server" CommandName="Save" OnClick="lnkSave_Click">Save</asp:LinkButton> 
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Cancel" OnClick="lnkCancel_Click">Cancel</asp:LinkButton> 
                </FooterTemplate> 
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" ><i class="fa fa-trash"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="panel panel-warning">
              <div class="panel-heading">
                <h3 class="panel-title">Atenção!!</h3>
              </div>
              <div class="panel-body">
                Não há propriedades.
              </div>
            </div>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:Button ID="button1" runat="server" class="btn btn-primary btn-sm"  OnClick="Button2_Click" Text="Adicionar nova propriedade" />
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/PropertiesData.xml" EnableCaching="False" TransformFile="~/App_Data/properties.xsl" XPath="/properties/property"></asp:XmlDataSource>
<asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/App_Data/PropertiesData.xml" EnableCaching="False"></asp:XmlDataSource>
</asp:Content>