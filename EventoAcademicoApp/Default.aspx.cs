using System;
using System.Collections.Generic;
using EventoAcademicoApp.Models;

namespace EventoAcademicoApp
{
    public partial class Default : System.Web.UI.Page
    {
        // Clave que se usa para almacenar la lista de participantes en Session.
        private const string SessionKeyParticipantes = "ListaParticipantes";

        protected void Page_Load(object sender, EventArgs e)
        {
            // IsPostBack para evitar reinicializar los mensajes informativos cada vez
            // que el usuario interactúa con un control que genera postback
            // (por ejemplo, al elegir la categoría o seleccionar una fecha).
            if (!IsPostBack)
            {
                lblInfoCategoria.Text = string.Empty;
                lblFechaSeleccionada.Text = "Si no selecciona fecha, se pondrá la de hoy automáticamente.";
            }
        }

        /// <summary>
        /// Evento de selección de la lista desplegable de categoría.
        /// Se dispara mediante AutoPostBack y actualiza un mensaje informativo
        /// según la categoría elegida por el usuario.
        /// </summary>
        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlCategoria.SelectedValue)
            {
                case "Estudiante":
                    lblInfoCategoria.Text = "Recuerde indicar el nombre de su institución educativa.";
                    break;
                case "Docente":
                    lblInfoCategoria.Text = "Los docentes participantes recibirán material adicional.";
                    break;
                case "Profesional":
                    lblInfoCategoria.Text = "Indique la empresa u organización donde labora.";
                    break;
                case "Egresado":
                    lblInfoCategoria.Text = "Gracias por continuar vinculado a la institución.";
                    break;
                default:
                    lblInfoCategoria.Text = string.Empty;
                    break;
            }
        }

        /// <summary>
        /// Evento que se dispara automáticamente al seleccionar una fecha en el
        /// control Calendar. Evidencia el uso de postback del control.
        /// </summary>
        protected void calAsistencia_SelectionChanged(object sender, EventArgs e)
        {
            lblFechaSeleccionada.Text = "Fecha seleccionada: " +
                calAsistencia.SelectedDate.ToShortDateString();
        }

        /// <summary>
        /// Evento Click del botón de registro. Verifica
        /// Page.IsValid antes de procesar los datos, almacena al participante
        /// en Session y redirige a la página de resumen.
        /// </summary>
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // IsValid antes de procesar datos.
            if (!Page.IsValid)
            {
                return;
            }

            Participante nuevo = new Participante
            {
                Nombre = txtNombre.Text.Trim(),
                Identificacion = txtIdentificacion.Text.Trim(),
                Correo = txtCorreo.Text.Trim(),
                Categoria = ddlCategoria.SelectedValue,
                Institucion = txtInstitucion.Text.Trim(),
                Edad = int.Parse(txtEdad.Text.Trim()),
                Modalidad = rblModalidad.SelectedValue,
                FechaAsistencia = calAsistencia.SelectedDate == DateTime.MinValue
                    ? DateTime.Today
                    : calAsistencia.SelectedDate,
                DeseaCertificado = chkCertificado.Checked,
                FechaRegistro = DateTime.Now
            };

            List<Participante> participantes = Session[SessionKeyParticipantes] as List<Participante>;
            if (participantes == null)
            {
                participantes = new List<Participante>();
            }
            participantes.Add(nuevo);
            Session[SessionKeyParticipantes] = participantes;

            // Se guarda el último registro para mostrar el mensaje de
            // confirmación en la página de resumen (Resumen.aspx).
            Session["UltimoParticipante"] = nuevo;

            // Navegación entre páginas mediante redirección desde el servidor.
            Response.Redirect("Resumen.aspx");
        }
    }
}
