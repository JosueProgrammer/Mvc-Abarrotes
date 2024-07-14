using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Proveedor
    {
        public static CD_Proveedor _instancia = null;

        private CD_Proveedor()
        {

        }

        public static CD_Proveedor Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Proveedor();
                }
                return _instancia;
            }
        }

        public List<Proveedor> ObtenerProveedores()
        {
            var rptListaProveedores = new List<Proveedor>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                SqlCommand cmd = new SqlCommand("USP_ProveedoresObtener", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    oConexion.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaProveedores.Add(new Proveedor()
                        {
                            id_Proveedor = Convert.ToInt32(dr["id_Proveedor"].ToString()),
                            nombre = dr["nombre"].ToString(),
                            direccion = dr["direccion"].ToString(),
                            telefono = dr["telefono"].ToString(),
                            email = dr["email"].ToString(),
                            estado = !string.IsNullOrEmpty(dr["estado"].ToString()) && Convert.ToBoolean(dr["estado"].ToString())
                        });
                    }

                    dr.Close();

                    return rptListaProveedores;
                }
                catch
                {
                    rptListaProveedores = null;
                    return rptListaProveedores;
                }
            }
        }

        public bool RegistrarProveedor(Proveedor oProveedor)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_RegistrarProveedor", oConexion);
                    cmd.Parameters.AddWithValue("nombre", oProveedor.nombre);
                    cmd.Parameters.AddWithValue("direccion", oProveedor.direccion ?? "");
                    cmd.Parameters.AddWithValue("telefono", oProveedor.telefono ?? "");
                    cmd.Parameters.AddWithValue("email", oProveedor.email ?? "");
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                }
                catch
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool ModificarProveedor(Proveedor oProveedor)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_ActualizarProveedor", oConexion);
                    cmd.Parameters.AddWithValue("id_Proveedor", oProveedor.id_Proveedor);
                    cmd.Parameters.AddWithValue("nombre", oProveedor.nombre);
                    cmd.Parameters.AddWithValue("direccion", oProveedor.direccion ?? "");
                    cmd.Parameters.AddWithValue("telefono", oProveedor.telefono ?? "");
                    cmd.Parameters.AddWithValue("email", oProveedor.email ?? "");
                    cmd.Parameters.AddWithValue("Activo", oProveedor.estado);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                }
                catch
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool EliminarProveedor(int id_Proveedor)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_EliminarProveedor", oConexion);
                    cmd.Parameters.AddWithValue("id_Proveedor", id_Proveedor);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
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
