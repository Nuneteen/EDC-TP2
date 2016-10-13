<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="titles.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Publication Type"></asp:Label>
    <br />

    

    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
<asp:DropDownList class="form-control" ID="DropDownList1" runat="server"  DataSourceID="SqlDataSource2" DataTextField="type" DataValueField="type" AutoPostBack="True" ForeColor="Black">
    </asp:DropDownList>
      </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PubsConnectionString1 %>" SelectCommand="SELECT * FROM [titles] WHERE ([title_id] = @title_id)" UpdateCommand="UPDATE titles SET title = @title, type = @type, pub_id = @pub_id, price = @price, advance = @advance, royalty = @royalty, ytd_sales = @ytd_sales, notes = @notes, pubdate = @pubdate WHERE (title_id = @title_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="title_id" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" />
            <asp:ControlParameter ControlID="DetailsView1$DropDownList2" Name="type" Type="String" PropertyName="SelectedValue" />
            <asp:Parameter Name="pub_id" />
            <asp:Parameter Name="price" />
            <asp:Parameter Name="advance" />
            <asp:Parameter Name="royalty" />
            <asp:Parameter Name="ytd_sales" />
            <asp:Parameter Name="notes" />
            <asp:Parameter Name="pubdate" />
            <asp:Parameter Name="title_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PubsConnectionString1 %>" SelectCommand="SELECT DISTINCT [type] FROM [titles]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Titles"></asp:Label>
    <asp:GridView class="table table-striped table-hover " ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="title_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."><SelectedRowStyle BackColor="Green" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text=""><i class="fa fa-check-square-o" aria-hidden="true"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="title_id" SortExpression="title_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("title_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="title" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="type" SortExpression="type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="pub_id" SortExpression="pub_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pub_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("pub_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubsConnectionString1 %>" DeleteCommand="DELETE FROM [titles] WHERE [title_id] = @title_id" InsertCommand="INSERT INTO [titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (@title_id, @title, @type, @pub_id, @price, @advance, @royalty, @ytd_sales, @notes, @pubdate)" SelectCommand="SELECT * FROM [titles] WHERE ([type] = @type)" UpdateCommand="UPDATE [titles] SET [title] = @title, [type] = @type, [pub_id] = @pub_id, [price] = @price, [advance] = @advance, [royalty] = @royalty, [ytd_sales] = @ytd_sales, [notes] = @notes, [pubdate] = @pubdate WHERE [title_id] = @title_id">
        <DeleteParameters>
            <asp:Parameter Name="title_id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title_id" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="pub_id" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="advance" Type="Decimal" />
            <asp:Parameter Name="royalty" Type="Int32" />
            <asp:Parameter Name="ytd_sales" Type="Int32" />
            <asp:Parameter Name="notes" Type="String" />
            <asp:Parameter Name="pubdate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="type" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="type" />
            <asp:Parameter Name="pub_id" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="advance" Type="Decimal" />
            <asp:Parameter Name="royalty" Type="Int32" />
            <asp:Parameter Name="ytd_sales" Type="Int32" />
            <asp:Parameter Name="notes" Type="String" />
            <asp:Parameter Name="pubdate" Type="DateTime" />
            <asp:Parameter Name="title_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:DetailsView class="table table-hover" OnItemUpdated="titleupdategrid" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="title_id" DataSourceID="SqlDataSource3" Height="50px" HeaderText="Title details">
        <Fields>
            <asp:BoundField  DataField="title_id" HeaderText="title_id" ReadOnly="True" SortExpression="title_id" />
            <asp:TemplateField HeaderText="title" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="type" SortExpression="type">
                <EditItemTemplate>
                    <asp:DropDownList class="form-control" Width="280px" ID="DropDownList2" runat="server" SelectedValue='<%# Bind("type") %>' DataSourceID="SqlDataSource2" DataTextField="type" DataValueField="type" AutoPostBack="True" ForeColor="Black"></asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox class="form-group" ID="TextBox1" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label class="form-group" ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="pub_id" SortExpression="pub_id">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox2" runat="server" Text='<%# Bind("pub_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pub_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("pub_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="price" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="advance" SortExpression="advance">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox4" runat="server" Text='<%# Bind("advance") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("advance") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("advance") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="royalty" SortExpression="royalty">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox5" runat="server" Text='<%# Bind("royalty") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("royalty") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("royalty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ytd_sales" SortExpression="ytd_sales">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" Text='<%# Bind("ytd_sales") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ytd_sales") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ytd_sales") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="notes" SortExpression="notes">
                <EditItemTemplate>
                    <asp:TextBox  class="form-control" TextMode="MultiLine" Width="280px"  Rows="4" ID="TextBox7" runat="server" Text='<%# Bind("notes") %>' style="resize:none " ></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="pubdate" SortExpression="pubdate">
                <EditItemTemplate>
                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" Text='<%# Bind("pubdate","{0:yyyy-MM-dd}") %>' Width="280px" TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("pubdate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("pubdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text=""><i class="fa fa-floppy-o" aria-hidden="true"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="fa fa-ban" aria-hidden="true"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text=""><i class="fa fa-pencil" aria-hidden="true"></i>
</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
<script runat="server">
       void titleupdategrid(object sender, DetailsViewUpdatedEventArgs e){
// Refresh the GridView control after a new record is updated 
// in the DetailsView control.
        GridView1.DataBind();
}
    </script>