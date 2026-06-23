using System;

namespace EventoAcademicoApp.Models
{
    /// <summary>
    /// Representa un participante registrado en el evento académico.
    /// Se marca como [Serializable] porque los objetos se almacenarán
    /// en Session, que es la alternativa básica
    /// ya que no se requiere una conexión a base de datos.
    /// </summary>
    [Serializable]
    public class Participante
    {
        public string Nombre { get; set; }
        public string Identificacion { get; set; }
        public string Correo { get; set; }
        public string Categoria { get; set; }
        public string Institucion { get; set; }
        public int Edad { get; set; }
        public string Modalidad { get; set; }
        public DateTime FechaAsistencia { get; set; }
        public bool DeseaCertificado { get; set; }
        public DateTime FechaRegistro { get; set; }
    }
}