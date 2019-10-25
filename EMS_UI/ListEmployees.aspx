<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListEmployees.aspx.cs" Inherits="EMS_UI.ListEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>List of Employees</h2>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridViewEmpList" runat="server" 
            EmptyDataText="No employees found" DataKeyNames="Number"
            OnRowDeleting="GridViewEmpList_RowDeleting1"
            CssClass="table table-striped table-hover">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <p>
            <script>
                $(document).on("click", "a", function () {
                    if (this.innerHTML.indexOf("Delete") == 0) {
                        return confirm("Are you sure you want to delete this record?");
                    }
                })
            </script>
        </p>
    </p>

</asp:Content>
