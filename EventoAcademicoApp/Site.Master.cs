using System;

namespace EventoAcademicoApp
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string page = Request.AppRelativeCurrentExecutionFilePath.ToLower();

            lnkFormulario.Attributes["class"] = "";
            lnkResumen.Attributes["class"] = "";

            if (page.Contains("default"))
            {
                lnkFormulario.Attributes["class"] = "active-nav";
            }
            else if (page.Contains("resumen"))
            {
                lnkResumen.Attributes["class"] = "active-nav";
            }
        }
    }
}
