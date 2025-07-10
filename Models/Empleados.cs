using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebGestorEmpleados.Models
{
    public class Empleados
    {
        public int EmpleadoID { get; set; }

        public string PrimerNombre { get; set; }

        public string PrimerApellido { get; set; }

        public string Correo { get; set; }

        public decimal Salario { get; set; }

        public int  DepartamentoId { get; set; }

        public string NombreDepartamento { get; set; }

        public DateTime FechaIngreso { get; set; } 
    }
}