<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesByDepartment.aspx.cs" Inherits="EMS_UI.EmployeesByDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Employees By Department</h2>
    <p>
        <asp:Label ID="LabelSelectDepartment" runat="server" Text="Select Department"></asp:Label>
        <asp:DropDownList ID="DropDownListDept" runat="server" DataTextField="FullName" DataValueField="DepartmentID">
        </asp:DropDownList>
        <asp:Button ID="ButtonSearchDepartment" runat="server" Text="Search Department" CssClass="btn btn-primary" OnClick="ButtonSearchDepartment_Click" />
        &#39;</p>
    <p>
        <asp:Label ID="LabelDepartmentName" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridViewEmployees" runat="server"
            EmptyDataText="No employees found"
            CssClass="table table-striped table-hover">            
        </asp:GridView>
    </p>
</asp:Content>
