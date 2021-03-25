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
    public partial class GestionSalarie : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            ChargeSalarie();
        }
        private void emptyTB()
        {
            this.TbNom.Text = "";
            this.TbPrenom.Text = "";
            this.TBfonction.Text = "";
            this.LidSalarie.Text = "";
            this.TBAdress.Text = "";
            this.TBAdressV.Text = "";
            this.TBAge.Text = "";
        }

        private void chargeDropdownlist()
        {
            DepartementDBAcess departementDBAcess = new DepartementDBAcess();
            this.DropDownIdDepartement.DataSource = departementDBAcess.getAllDepartement();
            this.DropDownIdDepartement.DataValueField = "idDepartement";
            this.DropDownIdDepartement.DataTextField = "description";
            this.DropDownIdDepartement.DataBind();
        }

        private void ChargeSalarie()
        {
            SalarieDBAcces salarieDBAcces = new SalarieDBAcces();
            this.GridView1.DataSource = salarieDBAcces.getAllSalarie();
            this.GridView1.DataBind();
            chargeDropdownlist();
        }

        protected void TbNom_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownIdDepartement_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Valid_Click(object sender, EventArgs e)
        {
            Salarie sal = new Salarie(this.TbNom.Text.ToString(), this.TbPrenom.Text.ToString(), this.TBfonction.Text.ToString(), Int16.Parse(this.DropDownIdDepartement.SelectedValue), Int16.Parse(this.TBAge.Text), this.TBAdressV.Text.ToString());
            SalarieDBAcces salarieDBAcces = new SalarieDBAcces();
            salarieDBAcces.addSalarie(sal);
            emptyTB();
        }

        protected void BtDelete_Click(object sender, EventArgs e)
        {
            SalarieDBAcces salarieDBAcces = new SalarieDBAcces();
            if (this.LidSalarie.Text !="")
            {
                salarieDBAcces.delSalarie(Int16.Parse(this.LidSalarie.Text));
            }
            emptyTB();
            this.ChargeSalarie();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LidSalarie.Text = this.GridView1.SelectedRow.Cells[1].Text;
            this.TbNom.Text = this.GridView1.SelectedRow.Cells[2].Text;
            this.TbPrenom.Text = this.GridView1.SelectedRow.Cells[3].Text;
            this.TBAge.Text = this.GridView1.SelectedRow.Cells[4].Text;
            this.TBfonction.Text = this.GridView1.SelectedRow.Cells[5].Text;
            this.DropDownIdDepartement.Items.FindByValue(this.GridView1.SelectedRow.Cells[6].Text);
            this.TBAdress.Text = this.GridView1.SelectedRow.Cells[7].Text.Trim();
        }

        protected void BtUpdate_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('" + this.LidSalarie.Text + "')</script>");
            if (this.LidSalarie.Text != "")
            {
                Salarie sal = new Salarie(this.TbNom.Text.ToString(), this.TbPrenom.Text.ToString(), this.TBfonction.Text.ToString(), Int16.Parse(this.DropDownIdDepartement.SelectedValue.ToString()), Int16.Parse(this.TBAge.Text.ToString()), this.TBAdressV.Text.ToString());
                sal.IdSalarie = Int16.Parse(this.LidSalarie.Text);
                SalarieDBAcces salarieDBAcces = new SalarieDBAcces();
                salarieDBAcces.updateSalarie(sal);
                emptyTB();
                ChargeSalarie();
            }
            
        }
    }
}