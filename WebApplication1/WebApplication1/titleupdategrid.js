<script runat="server">
       void titleupdategrid(object sender, DetailsViewUpdatedEventArgs e){
// Refresh the GridView control after a new record is updated 
// in the DetailsView control.
        GridView1_titles.DataBind();
}
    </script>