using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace CapaDatos
{
    public class CD_Devolucion
    {
        private static CD_Devolucion _instancia = null;

        private CD_Devolucion()
        {
        }

        public static CD_Devolucion Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Devolucion();
                }
                return _instancia;
            }
        }

        public List<Devolucion> ObtenerDevoluciones()
        {
            var rptListaDevolucion = new List<Devolucion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                SqlCommand cmd = new SqlCommand("USP_ObtenerDevoluciones", oConexion)
                {
                    CommandType = CommandType.StoredProcedure
                };

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaDevolucion.Add(new Devolucion()
                        {
                            id_Devolucion = Convert.ToInt32(dr["id_Devolucion"].ToString()),
                            Fecha_Devolucion = dr["Fecha_Devolucion"].ToString(),
                            Nombre = dr["Nombre"].ToString(),
                            Descripcion = dr["Descripcion"].ToString()
                        });
                    }

                    dr.Close();
                    return rptListaDevolucion;
                }
                catch
                {
                    rptListaDevolucion = null;
                    return rptListaDevolucion;
                }
            }
        }

        public bool RegistrarDevolucion(Devolucion devolucion)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_RegistrarDevolucion", oConexion);
                    cmd.Parameters.AddWithValue("@Fecha_Devolucion", devolucion.Fecha_Devolucion);
                    cmd.Parameters.AddWithValue("@Nombre", devolucion.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", devolucion.Descripcion);
                    SqlParameter outputParam = new SqlParameter("@Resultado", SqlDbType.Bit) { Direction = ParameterDirection.Output };
                    cmd.Parameters.Add(outputParam);

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToBoolean(outputParam.Value);
                }
                catch
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool ModificarDevolucion(Devolucion devolucion)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_ModificarDevolucion", oConexion);
                    cmd.Parameters.AddWithValue("@id_Devolucion", devolucion.id_Devolucion);
                    cmd.Parameters.AddWithValue("@Fecha_Devolucion", devolucion.Fecha_Devolucion);
                    cmd.Parameters.AddWithValue("@Nombre", devolucion.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", devolucion.Descripcion);
                    SqlParameter outputParam = new SqlParameter("@Resultado", SqlDbType.Bit) { Direction = ParameterDirection.Output };
                    cmd.Parameters.Add(outputParam);

                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToBoolean(outputParam.Value);
                }
                catch
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool EliminarDevolucion(int id_Devolucion)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_EliminarDevolucion", oConexion);
                    cmd.Parameters.AddWithValue("@id_Devolucion", id_Devolucion);
                    SqlParameter outputParam = new SqlParameter("@Resultado", SqlDbType.Bit) { Direction = ParameterDirection.Output };
                    cmd.Parameters.Add(outputParam);

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToBoolean(outputParam.Value);
                }
                catch
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }
    }
}
