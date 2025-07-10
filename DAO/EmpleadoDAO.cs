using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebGestorEmpleados.Models;

namespace WebGestorEmpleados.DAO
{
    public class EmpleadoDAO
    {
        private readonly string connectionString;
        public EmpleadoDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
        }

        public List<Empleados> ObtenerTodosEmpleados()
        {
            List<Empleados> empleados = new List<Empleados>();

            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                using (SqlCommand comando = new SqlCommand("sp_ObtenerTodosEmpleados", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        conexion.Open();

                        using (SqlDataReader lea = comando.ExecuteReader())
                        {
                            while (lea.Read())
                            {
                                Empleados empleado = new Empleados
                                {
                                    EmpleadoID = Convert.ToInt32(lea["EmpleadoID"]),
                                    PrimerNombre = lea["PrimerNombre"].ToString(),
                                    PrimerApellido = lea["PrimerApellido"].ToString(),
                                    Correo = lea["Correo"].ToString(),
                                    Salario = Convert.ToDecimal(lea["Salario"].ToString()),
                                    FechaIngreso = Convert.ToDateTime(lea["FechaIngreso"].ToString()),
                                    NombreDepartamento = lea["Nombre"].ToString(),

                                };
                                empleados.Add(empleado);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                    finally
                    {
                        conexion.Close();
                    }
                }

            }

            return empleados;
        }
    }
}