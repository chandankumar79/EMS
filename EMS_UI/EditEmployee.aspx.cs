using EMS_DAL;
using EMS_DAL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        private int Number;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownDepartment.DataSource = DAL.GetDepartments();
                DropDownDepartment.DataBind();

                DropDownListManager.DataSource = DAL.GetEmployeeIdAndName();
                DropDownListManager.DataBind();
                DropDownListManager.Items.Add(new ListItem("--Select--", "0"));
                DropDownListManager.SelectedValue = "0";
            }
        }

        protected void ButtonGetEmpById_Click(object sender, EventArgs e)
        {
            this.Number = Convert.ToInt32(TextBoxEmpId.Text);
            DataSet employee = DAL.GetEmployeeId(Convert.ToInt32(TextBoxEmpId.Text));
            if(employee.Tables[0].Rows.Count == 0)
            {
                // employees not found
                ScriptManager.RegisterStartupScript(this, this.GetType(), 
                    "showalert", "alert('Employee not found.');", true);
            }
            else
            {
                // employee found
                TextBoxFullName.Text = employee.Tables[0].Rows[0]["FullName"].ToString();
                TextBoxEmail.Text = employee.Tables[0].Rows[0]["Email"].ToString();
                RadioButtonGender.SelectedValue = employee.Tables[0].Rows[0]["Gender"].ToString();
                DropDownDepartment.SelectedValue = employee.Tables[0].Rows[0]["DepartmentNo"].ToString();
                TextBoxDateOfBirth.Text = Convert.ToDateTime(employee.Tables[0].Rows[0]["DateOfBirth"]).ToString("yyyy-MM-dd");
                TextBoxDateOfJoining.Text = Convert.ToDateTime(employee.Tables[0].Rows[0]["DateOfJoining"]).ToString("yyyy-MM-dd");
                if(!string.IsNullOrEmpty(employee.Tables[0].Rows[0]["ReportingTo"].ToString()))
                {
                    DropDownListManager.SelectedValue = employee.Tables[0].Rows[0]["ReportingTo"].ToString();
                }
                TextBoxPhone.Text = employee.Tables[0].Rows[0]["Phone"].ToString();
                TextBoxSalary.Text = Convert.ToInt32(employee.Tables[0].Rows[0]["Salary"]).ToString();
                TextBoxCommission.Text = Convert.ToInt32(employee.Tables[0].Rows[0]["Commission"]).ToString();
                DropDownListJobTitle.SelectedValue = employee.Tables[0].Rows[0]["JobTitle"].ToString();
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            // update
            Employee employee = new Employee
            {
                Number = Convert.ToInt32(TextBoxEmpId.Text),
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
            bool result = DAL.UpdateEmployee(employee);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('Employee data update Successfully'); window.location='ListEmployees.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Failed to update employee data');", true);
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            // cancel
        }
    }
}