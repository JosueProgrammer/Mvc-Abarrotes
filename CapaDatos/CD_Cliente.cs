using CapaModelo; 
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Cliente
    {
        public static CD_Cliente _instancia = null;

        private CD_Cliente()
        {

        }

        public static CD_Cliente Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Cliente();
                }
                return _instancia;
            }
        }

        public List<Cliente> ObtenerClientes()
        {
            var listaClientes = new List<Cliente>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                SqlCommand cmd = new SqlCommand("USP_ObtenerClientes", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    oConexion.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        listaClientes.Add(new Cliente()
                        {
                            id_Cliente = Convert.ToInt32(dr["Id_Cliente"]),
                            Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                            Direccion_Cliente = dr["Direccion_Cliente"].ToString(),
                            Telefono_Cliente = dr["Telefono_Cliente"].ToString(),
                            Email_Cliente = dr["Email_Cliente"].ToString()
                        });
                    }

                    dr.Close();

                    return listaClientes;
                }
                catch
                {
                    listaClientes = null;
                    return listaClientes;
                }
            }
        }

        public bool RegistrarCliente(Cliente oCliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_RegistrarCliente", oConexion);
                    cmd.Parameters.AddWithValue("Nombre_Cliente", oCliente.Nombre_Cliente);
                    cmd.Parameters.AddWithValue("Direccion_Cliente", oCliente.Direccion_Cliente ?? "");
                    cmd.Parameters.AddWithValue("Telefono_Cliente", oCliente.Telefono_Cliente ?? "");
                    cmd.Parameters.AddWithValue("Email_Cliente", oCliente.Email_Cliente ?? "");
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

        public bool ModificarCliente(Cliente oCliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_ModificarCliente", oConexion);
                    cmd.Parameters.AddWithValue("id_Cliente", oCliente.id_Cliente);
                    cmd.Parameters.AddWithValue("Nombre_Cliente", oCliente.Nombre_Cliente);
                    cmd.Parameters.AddWithValue("Direccion_Cliente", oCliente.Direccion_Cliente ?? "");
                    cmd.Parameters.AddWithValue("Telefono_Cliente", oCliente.Telefono_Cliente ?? "");
                    cmd.Parameters.AddWithValue("Email_Cliente", oCliente.Email_Cliente ?? "");
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

        public bool EliminarCliente(int idCliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.Con()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("USP_EliminarCliente", oConexion);
                    cmd.Parameters.AddWithValue("Id_Cliente", idCliente);
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
