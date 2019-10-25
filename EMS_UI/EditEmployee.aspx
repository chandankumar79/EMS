<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="EMS_UI.EditEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit Employee</h2>
    <p>
        <asp:Label ID="LabelEmpId" runat="server" Text="Enter Employee ID"></asp:Label>
        <asp:TextBox ID="TextBoxEmpId" runat="server" TextMode="Number"></asp:TextBox>
        <asp:Button ID="ButtonGetEmpById" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="ButtonGetEmpById_Click" ValidationGroup="SearchGroup" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Employee id is required" ControlToValidate="TextBoxEmpId" ValidationGroup="SearchGroup"></asp:RequiredFieldValidator>
    </p>
        <table class="table table-striped">
        <tr>
            <td>Full Name</td>
            <td><asp:TextBox ID="TextBoxFullName" runat="server" CssClass="form-control"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxFullName" ValidationGroup="UpdateGroup">Name is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxEmail" ValidationGroup="UpdateGroup">Email is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>                    
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RadioButtonGender" ValidationGroup="UpdateGroup">Gender is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DropDownDepartment" runat="server" CssClass="form-control" DataTextField="FullName" DataValueField="DepartmentId">

                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownDepartment" ValidationGroup="UpdateGroup">Department is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfBirth" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDateOfBirth" ValidationGroup="UpdateGroup">Date of birth is required</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TextBoxDateOfBirth" Operator="LessThan" Type="Date" ValueToCompare="2019-10-23" ValidationGroup="UpdateGroup">Invalid date of birth</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>Date of Joining</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfJoining" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDateOfJoining" ValidationGroup="UpdateGroup">Date of joining is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Manager</td>
            <td>
                <asp:DropDownList ID="DropDownListManager" runat="server" CssClass="form-control" DataTextField="FullName" DataValueField="Number">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownListManager" ValidationGroup="UpdateGroup">Manager is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Type="Double" ControlToValidate="TextBoxPhone" MaximumValue="9999999999" MinimumValue="1000000000" ValidationGroup="UpdateGroup">Phone number must me 10 digits</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxPhone" ValidationGroup="UpdateGroup">Phone number is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Salary</td>
            <td>
                <asp:TextBox ID="TextBoxSalary" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxSalary" ValidationGroup="UpdateGroup">Salary is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Commission</td>
            <td>
                <asp:TextBox ID="TextBoxCommission" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxCommission" ValidationGroup="UpdateGroup">Commission is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Job Title</td>
            <td>
                <asp:DropDownList ID="DropDownListJobTitle" runat="server" CssClass="form-control">
                    <asp:ListItem>Developer</asp:ListItem>
                    <asp:ListItem>Analyst</asp:ListItem>
                    <asp:ListItem>Salesman</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                    <asp:ListItem>Tester</asp:ListItem>
                    <asp:ListItem>Accountant</asp:ListItem>
                    <asp:ListItem>Cashier</asp:ListItem>
                    <asp:ListItem>President</asp:ListItem>
                    <asp:ListItem>Senior Developer</asp:ListItem>
                    <asp:ListItem>CEO</asp:ListItem>
                    <asp:ListItem>COO</asp:ListItem>
                    <asp:ListItem>CFO</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownListJobTitle" ValidationGroup="UpdateGroup">Job title is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="ButtonUpdate_Click" ValidationGroup="UpdateGroup" />
                <asp:Button ID="Cancel" runat="server" Text="Cancel" CssClass="btn btn-warning" CausesValidation="False" OnClick="Cancel_Click" />
            </td>
            <td></td>
        </tr>
    </table>

</asp:Content>
