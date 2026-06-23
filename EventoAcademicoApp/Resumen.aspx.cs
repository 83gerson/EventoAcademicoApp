using System;
using System.Collections.Generic;
using EventoAcademicoApp.Models;

namespace EventoAcademicoApp
{
    public partial class Resumen : System.Web.UI.Page
    {
        private const string SessionKeyParticipantes = "ListaParticipantes";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarMensajeConfirmacion();
                CargarParticipantes();
            }
        }

        /// <summary>
        /// Muestra el mensaje de confirmación del último participante
        /// registrado, si la página fue alcanzada justo después de un
        /// registro exitoso en Default.aspx.
        /// </summary>
        private void MostrarMensajeConfirmacion()
        {
            Participante ultimo = Session["UltimoParticipante"] as Participante;
            if (ultimo != null)
            {
                lblConfirmacion.Text = string.Format(
                    "¡Registro exitoso! Gracias, {0}, su inscripción como {1} ha sido registrada correctamente.",
                    ultimo.Nombre, ultimo.Categoria);
                pnlConfirmacion.Visible = true;

                // Se limpia para que el mensaje no se repita si se visita la página de nuevo.
                Session["UltimoParticipante"] = null;
            }
        }

        /// <summary>
        /// Carga en el GridView la lista completa de participantes
        /// almacenada temporalmente en Session.
        /// </summary>
        private void CargarParticipantes()
        {
            List<Participante> participantes = Session[SessionKeyParticipantes] as List<Participante>;
            gvParticipantes.DataSource = participantes;
            gvParticipantes.DataBind();
        }

        /// <summary>
        /// Navegación de regreso al formulario de registro.
        /// </summary>
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
