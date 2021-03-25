using ClassLibraryDataAccess;
using ClassLibraryEntite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSSDB.SalarieDep
{
    public partial class GestionDepartement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ChargeDepartement();
        }

        public void ChargeDepartement()
        {
            DepartementDBAcess departementDBAcess = new DepartementDBAcess();
            this.GridView1.DataSource = departementDBAcess.getAllDepartement();
            this.GridView1.DataBind();
        }

        protected void BUpdate_Click(object sender, EventArgs e)
        {
            DepartementDBAcess departementDBAcess = new DepartementDBAcess();
            Departement departement = new Departement();
            departement.Id = Int16.Parse(this.TBId.Text);
            departement.Description = this.TBDescription.Text;
            ChargeDepartement();
        }

        protected void Badd_Click(object sender, EventArgs e)
        {
            Departement departement = new Departement();
            departement.Description = this.TBDescription.Text;
            DepartementDBAcess departementDBAcess = new DepartementDBAcess();
            departementDBAcess.addDepartement(departement);
            ChargeDepartement();
        }

        protected void BDel_Click(object sender, EventArgs e)
        {
            DepartementDBAcess departement = new DepartementDBAcess();
            departement.delDepartement(Int16.Parse(this.TBId.Text.ToString()));
            ChargeDepartement();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TBId.Text = this.GridView1.SelectedRow.Cells[1].Text;
            this.TBDescription.Text = this.GridView1.SelectedRow.Cells[2].Text;
        }
    }
}