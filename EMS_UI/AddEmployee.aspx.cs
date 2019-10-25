using EMS_DAL;
using EMS_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownDepartment.DataSource = DAL.GetDepartments();
                DropDownDepartment.DataBind();

                DropDownListManager.DataSource = DAL.GetEmployeeIdAndName();
                DropDownListManager.DataBind();
            }
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            Employee employee = new Employee
            {
                FullName = TextBoxFullName.Text,
                Email = TextBoxEmail.Text,
                Gender = RadioButtonGender.SelectedItem.Text,
                DepartmentNo = Convert.ToInt32(DropDownDepartment.SelectedItem.Value),
                DateOfBirth = Convert.ToDateTime(TextBoxDateOfBirth.Text),
                DateOfJoining = Convert.ToDateTime(TextBoxDateOfJoining.Text),
                ReportingTo = Convert.ToInt32(DropDownListManager.SelectedItem.Value),
                Phone = Convert.ToInt64(TextBoxPhone.Text),
                Salary = Convert.ToInt32(TextBoxSalary.Text),
                Commission = Convert.ToInt32(TextBoxCommission.Text),
                JobTitle = DropDownListJobTitle.SelectedItem.Value
            };
            bool result = DAL.AddEmployee(employee);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('Employee added Successfully'); window.location='ListEmployees.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Failed to add employee');", true);
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}