<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="EMS_UI.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New Employee</h2>
    <table>
        <tr>
            <td>Full Name</td>
            <td><asp:TextBox ID="TextBoxFullName" runat="server" CssClass="form-control"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxFullName">Name is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxEmail">Email is required</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RadioButtonGender">Gender is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DropDownDepartment" runat="server" CssClass="form-control" DataTextField="FullName" DataValueField="DepartmentId">

                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownDepartment">Department is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfBirth" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDateOfBirth">Date of birth is required</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TextBoxDateOfBirth" Operator="LessThan" Type="Date" ValueToCompare="2019-10-23">Invalid date of birth</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>Date of Joining</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfJoining" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDateOfJoining">Date of joining is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Manager</td>
            <td>
                <asp:DropDownList ID="DropDownListManager" runat="server" CssClass="form-control" DataTextField="FullName" DataValueField="Number">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownListManager">Manager is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Type="Double" ControlToValidate="TextBoxPhone" MaximumValue="9999999999" MinimumValue="1000000000">Phone number must me 10 digits</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxPhone">Phone number is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Salary</td>
            <td>
                <asp:TextBox ID="TextBoxSalary" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxSalary">Salary is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Commission</td>
            <td>
                <asp:TextBox ID="TextBoxCommission" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxCommission">Commission is required</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownListJobTitle">Job title is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonCreate" runat="server" Text="Create" CssClass="btn btn-success" OnClick="ButtonCreate_Click" />
                <asp:Button ID="Cancel" runat="server" Text="Cancel" CssClass="btn btn-warning" CausesValidation="False" OnClick="Cancel_Click" />
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
