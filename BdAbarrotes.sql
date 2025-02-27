USE [master]
GO
/****** Object:  Database [Abarrotes]    Script Date: 21/06/2024 16:22:21 ******/
CREATE DATABASE [Abarrotes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Abarrotes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Abarrotes.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Abarrotes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Abarrotes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Abarrotes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Abarrotes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Abarrotes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Abarrotes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Abarrotes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Abarrotes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Abarrotes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Abarrotes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Abarrotes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Abarrotes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Abarrotes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Abarrotes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Abarrotes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Abarrotes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Abarrotes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Abarrotes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Abarrotes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Abarrotes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Abarrotes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Abarrotes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Abarrotes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Abarrotes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Abarrotes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Abarrotes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Abarrotes] SET RECOVERY FULL 
GO
ALTER DATABASE [Abarrotes] SET  MULTI_USER 
GO
ALTER DATABASE [Abarrotes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Abarrotes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Abarrotes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Abarrotes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Abarrotes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Abarrotes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Abarrotes', N'ON'
GO
ALTER DATABASE [Abarrotes] SET QUERY_STORE = ON
GO
ALTER DATABASE [Abarrotes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Abarrotes]
GO
/****** Object:  Table [dbo].[DetalleClienteCompra]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleClienteCompra](
	[id_cliente] [int] NULL,
	[id_Venta] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Bodega]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Bodega](
	[id_Bodega] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Bodega] [varchar](50) NULL,
	[Ubicacion] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Bodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Categoria]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Categoria](
	[id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Cliente]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [varchar](50) NULL,
	[Direccion_Cliente] [varchar](90) NULL,
	[Telefono_Cliente] [varchar](50) NULL,
	[Email_Cliente] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Compra]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Compra](
	[id_Compra] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado] [int] NULL,
	[Fecha_Compra] [datetime2](7) NULL,
	[IVA] [decimal](18, 0) NULL,
	[Descuento] [decimal](10, 2) NULL,
	[Subtotal] [decimal](10, 2) NULL,
	[Total] [decimal](15, 2) NULL,
	[id_Proveedor] [int] NULL,
	[Estado] [bit] NULL,
	[Nombre] [nvarchar](50) NULL,
	[NFactura] [int] NULL,
	[Precio_Venta] [decimal](18, 0) NULL,
	[Precio_Producto] [decimal](18, 0) NULL,
	[Cantidad] [int] NULL,
	[id_Producto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Descartado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Descartado](
	[id_Descartado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Descartado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Detalle_Venta]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Detalle_Venta](
	[id_DetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[id_Venta] [int] NULL,
	[id_Producto] [int] NULL,
	[cantidad] [int] NOT NULL,
	[IVA] [decimal](10, 2) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Sub_Total_Venta] [decimal](10, 2) NULL,
	[Total_Venta] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_DetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DetalleCompra]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DetalleCompra](
	[id_DetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[id_Compra] [int] NULL,
	[id_Producto] [int] NULL,
	[id_Categoria] [int] NULL,
	[Precio_Producto] [decimal](10, 2) NULL,
	[SubTotal_Compra] [decimal](10, 2) NULL,
	[Total_Compra] [decimal](10, 2) NULL,
	[Descuento] [decimal](10, 2) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_DetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Devolucion]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Devolucion](
	[id_Devolucion] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Devolucion] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Empleado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Empleado](
	[id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Empleado] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Numero_Cedula] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Inventario]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Inventario](
	[id_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[id_Bodega] [int] NOT NULL,
	[id_Categoria] [int] NOT NULL,
	[id_Proveedor] [int] NOT NULL,
	[id_Devolucion] [int] NULL,
	[id_Producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Ingreso] [datetime2](7) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Producto]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Producto](
	[id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[id_Categoria] [int] NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Producto_Dañado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Producto_Dañado](
	[id_ProductoDañado] [int] IDENTITY(1,1) NOT NULL,
	[id_Inventario] [int] NULL,
	[id_Descartado] [int] NULL,
	[Nombre_Producto] [varchar](50) NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ProductoDañado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Proveedor]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Proveedor](
	[id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](200) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Venta]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Venta](
	[id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado] [int] NOT NULL,
	[fecha_Venta] [datetime2](7) NULL,
	[IVA] [decimal](10, 2) NULL,
	[Descuento] [decimal](10, 2) NULL,
	[Subtotal_Venta] [decimal](10, 2) NULL,
	[Total] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_User] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Usuario] [varchar](245) NULL,
	[clave] [varchar](245) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleClienteCompra]  WITH CHECK ADD  CONSTRAINT [fk] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Tbl_Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[DetalleClienteCompra] CHECK CONSTRAINT [fk]
GO
ALTER TABLE [dbo].[DetalleClienteCompra]  WITH CHECK ADD  CONSTRAINT [fkVentas] FOREIGN KEY([id_Venta])
REFERENCES [dbo].[Tbl_Venta] ([id_Venta])
GO
ALTER TABLE [dbo].[DetalleClienteCompra] CHECK CONSTRAINT [fkVentas]
GO
ALTER TABLE [dbo].[Tbl_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Compra_Productos] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Tbl_Producto] ([id_Producto])
GO
ALTER TABLE [dbo].[Tbl_Compra] CHECK CONSTRAINT [FK_Tbl_Compra_Productos]
GO
ALTER TABLE [dbo].[Tbl_Compra]  WITH CHECK ADD  CONSTRAINT [Fk3] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[Tbl_Empleado] ([id_Empleado])
GO
ALTER TABLE [dbo].[Tbl_Compra] CHECK CONSTRAINT [Fk3]
GO
ALTER TABLE [dbo].[Tbl_Compra]  WITH CHECK ADD  CONSTRAINT [fk4] FOREIGN KEY([id_Proveedor])
REFERENCES [dbo].[Tbl_Proveedor] ([id_Proveedor])
GO
ALTER TABLE [dbo].[Tbl_Compra] CHECK CONSTRAINT [fk4]
GO
ALTER TABLE [dbo].[Tbl_Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [fk5] FOREIGN KEY([id_Venta])
REFERENCES [dbo].[Tbl_Venta] ([id_Venta])
GO
ALTER TABLE [dbo].[Tbl_Detalle_Venta] CHECK CONSTRAINT [fk5]
GO
ALTER TABLE [dbo].[Tbl_Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Tbl_Producto] ([id_Producto])
GO
ALTER TABLE [dbo].[Tbl_Detalle_Venta] CHECK CONSTRAINT [fk6]
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([id_Compra])
REFERENCES [dbo].[Tbl_Compra] ([id_Compra])
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra] CHECK CONSTRAINT [fk7]
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Tbl_Producto] ([id_Producto])
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra] CHECK CONSTRAINT [fk8]
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra]  WITH CHECK ADD  CONSTRAINT [fk9] FOREIGN KEY([id_Categoria])
REFERENCES [dbo].[Tbl_Categoria] ([id_Categoria])
GO
ALTER TABLE [dbo].[Tbl_DetalleCompra] CHECK CONSTRAINT [fk9]
GO
ALTER TABLE [dbo].[Tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Bodega] FOREIGN KEY([id_Bodega])
REFERENCES [dbo].[Tbl_Bodega] ([id_Bodega])
GO
ALTER TABLE [dbo].[Tbl_Inventario] CHECK CONSTRAINT [FK_Inventario_Bodega]
GO
ALTER TABLE [dbo].[Tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Categoria] FOREIGN KEY([id_Categoria])
REFERENCES [dbo].[Tbl_Categoria] ([id_Categoria])
GO
ALTER TABLE [dbo].[Tbl_Inventario] CHECK CONSTRAINT [FK_Inventario_Categoria]
GO
ALTER TABLE [dbo].[Tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Devolucion] FOREIGN KEY([id_Devolucion])
REFERENCES [dbo].[Tbl_Devolucion] ([id_Devolucion])
GO
ALTER TABLE [dbo].[Tbl_Inventario] CHECK CONSTRAINT [FK_Inventario_Devolucion]
GO
ALTER TABLE [dbo].[Tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Tbl_Producto] ([id_Producto])
GO
ALTER TABLE [dbo].[Tbl_Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
ALTER TABLE [dbo].[Tbl_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Proveedor] FOREIGN KEY([id_Proveedor])
REFERENCES [dbo].[Tbl_Proveedor] ([id_Proveedor])
GO
ALTER TABLE [dbo].[Tbl_Inventario] CHECK CONSTRAINT [FK_Inventario_Proveedor]
GO
ALTER TABLE [dbo].[Tbl_Producto]  WITH CHECK ADD  CONSTRAINT [FK1] FOREIGN KEY([id_Categoria])
REFERENCES [dbo].[Tbl_Categoria] ([id_Categoria])
GO
ALTER TABLE [dbo].[Tbl_Producto] CHECK CONSTRAINT [FK1]
GO
ALTER TABLE [dbo].[Tbl_Producto_Dañado]  WITH CHECK ADD  CONSTRAINT [fk10] FOREIGN KEY([id_Inventario])
REFERENCES [dbo].[Tbl_Inventario] ([id_Inventario])
GO
ALTER TABLE [dbo].[Tbl_Producto_Dañado] CHECK CONSTRAINT [fk10]
GO
ALTER TABLE [dbo].[Tbl_Producto_Dañado]  WITH CHECK ADD  CONSTRAINT [fk11] FOREIGN KEY([id_Descartado])
REFERENCES [dbo].[Tbl_Descartado] ([id_Descartado])
GO
ALTER TABLE [dbo].[Tbl_Producto_Dañado] CHECK CONSTRAINT [fk11]
GO
ALTER TABLE [dbo].[Tbl_Venta]  WITH CHECK ADD  CONSTRAINT [FK2] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[Tbl_Empleado] ([id_Empleado])
GO
ALTER TABLE [dbo].[Tbl_Venta] CHECK CONSTRAINT [FK2]
GO
/****** Object:  StoredProcedure [dbo].[USP_ActualizarProveedor]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[USP_ActualizarProveedor]
    @id_Proveedor INT,
    @nombre VARCHAR(100),
    @direccion VARCHAR(200),
    @telefono VARCHAR(20),
    @email VARCHAR(100),
    @Activo BIT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Tbl_Proveedor WHERE id_Proveedor = @id_Proveedor)
    BEGIN
        UPDATE Tbl_Proveedor
        SET nombre = @nombre,
            direccion = @direccion,
            telefono = @telefono,
            email = @email,
            estado = @Activo
        WHERE id_Proveedor = @id_Proveedor;

        SET @Resultado = 1; -- Proveedor actualizado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Proveedor no encontrado
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_BodegaEliminar]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_BodegaEliminar]
    @id_Bodega int,
    @Resultado bit OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    IF EXISTS (SELECT * FROM Tbl_Bodega WHERE id_Bodega = @id_Bodega)
    BEGIN
        DELETE FROM Tbl_Bodega WHERE id_Bodega = @id_Bodega;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_BodegaObtener]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_BodegaObtener]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT id_Bodega, Nombre_Bodega, Ubicacion, Estado FROM Tbl_Bodega;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoriaEliminar]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_CategoriaEliminar] 
@cod int, 
@Resultado bit output 
AS 
begin  set @Resultado =1 set nocount on; 
If Exists(select id_Categoria from Tbl_Categoria where id_Categoria=@cod) 
 	delete from Tbl_Categoria where id_Categoria=@cod 
else  
 	set @Resultado=0 
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoriasObtener]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_CategoriasObtener] 
AS 
BEGIN 
 	SET NOCOUNT ON; 
 
 	SELECT id_Categoria,Nombre_Categoria,Descripcion,Estado from Tbl_Categoria; 
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_EliminarCliente]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EliminarCliente]
    @id_Cliente INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Tbl_Cliente WHERE id_Cliente = @id_Cliente)
    BEGIN
        DELETE FROM Tbl_Cliente
        WHERE id_Cliente = @id_Cliente;

        SET @Resultado = 1; -- Cliente eliminado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Cliente no encontrado
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EliminarDescartado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EliminarDescartado]
    @id_Descartado INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM Tbl_Descartado WHERE id_Descartado = @id_Descartado)
    BEGIN
        DELETE FROM Tbl_Descartado
        WHERE id_Descartado = @id_Descartado;

        SET @Resultado = 1; -- Registro eliminado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Registro no encontrado
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EliminarDevolucion]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EliminarDevolucion]
    @id_Devolucion INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    IF EXISTS (SELECT 1 FROM Tbl_Devolucion WHERE id_Devolucion = @id_Devolucion)
    BEGIN
        DELETE FROM Tbl_Devolucion WHERE id_Devolucion = @id_Devolucion;
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- No se encontró el registro
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EliminarEmpleado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EliminarEmpleado]
    @id_Empleado INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET @Resultado = 1;

    IF EXISTS (SELECT 1 FROM Tbl_Empleado WHERE id_Empleado = @id_Empleado)
    BEGIN
        DELETE FROM Tbl_Empleado WHERE id_Empleado = @id_Empleado;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_EliminarProveedor]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EliminarProveedor]
    @id_Proveedor INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Tbl_Proveedor WHERE id_Proveedor = @id_Proveedor)
    BEGIN
        DELETE FROM Tbl_Proveedor
        WHERE id_Proveedor = @id_Proveedor;

        SET @Resultado = 1; -- Proveedor eliminado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Proveedor no encontrado
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarBodega]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ModificarBodega]
    @id_Bodega INT,
    @Nombre_Bodega VARCHAR(50),
    @Ubicacion VARCHAR(50),
    @Estado VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    IF EXISTS (SELECT * FROM Tbl_Bodega WHERE id_Bodega = @id_Bodega)
    BEGIN
        UPDATE Tbl_Bodega
        SET Nombre_Bodega = @Nombre_Bodega,
            Ubicacion = @Ubicacion,
            Estado = @Estado
        WHERE id_Bodega = @id_Bodega;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarCategoria]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_ModificarCategoria]( 
@IDCategoria int, 
@NombreCat  varchar(50), 
@Descripcion varchar (50), 
@Activo bit, 
@Resultado bit output 
) 
as  
begin  set @Resultado=1 
if not exists(select * from Tbl_Categoria where Nombre_Categoria=@NombreCat and id_Categoria 
!=@IDCategoria) 
 	update Tbl_Categoria set  
 	Nombre_Categoria=@NombreCat, 
 	Descripcion=@Descripcion,  	Estado=@Activo 
 	where id_Categoria=@IDCategoria 
else  
 	set @Resultado=0; 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarCliente]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ModificarCliente]
    @id_Cliente INT,
    @Nombre_Cliente VARCHAR(100),
    @Direccion_Cliente VARCHAR(200),
    @Telefono_Cliente VARCHAR(20),
    @Email_Cliente VARCHAR(100),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Tbl_Cliente WHERE id_Cliente = @id_Cliente)
    BEGIN
        UPDATE Tbl_Cliente
        SET Nombre_Cliente = @Nombre_Cliente,
            Direccion_Cliente = @Direccion_Cliente,
            Telefono_Cliente = @Telefono_Cliente,
            Email_Cliente = @Email_Cliente
        WHERE id_Cliente = @id_Cliente;

        SET @Resultado = 1; -- Cliente actualizado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Cliente no encontrado
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarDescartado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ModificarDescartado]
    @id_Descartado INT,
    @Nombre VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM Tbl_Descartado WHERE id_Descartado = @id_Descartado)
    BEGIN
        UPDATE Tbl_Descartado
        SET Nombre = @Nombre
        WHERE id_Descartado = @id_Descartado;

        SET @Resultado = 1; -- Registro modificado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Registro no encontrado
    END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarDevolucion]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ModificarDevolucion]
    @id_Devolucion INT,
    @Fecha_Devolucion VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    IF EXISTS (SELECT 1 FROM Tbl_Devolucion WHERE id_Devolucion = @id_Devolucion)
    BEGIN
        UPDATE Tbl_Devolucion
        SET Fecha_Devolucion = @Fecha_Devolucion,
            Nombre = @Nombre,
            Descripcion = @Descripcion
        WHERE id_Devolucion = @id_Devolucion;
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- No se encontró el registro
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarEmpleado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ModificarEmpleado] (
    @id_Empleado int,
    @Nombre_Empleado varchar(50),
    @Direccion varchar(50),
    @Numero_Cedula varchar(50),
    @Telefono varchar(50),
    @Resultado bit OUTPUT
)
AS
BEGIN
    SET @Resultado = 1;
    IF NOT EXISTS (SELECT * FROM Tbl_Empleado WHERE Numero_Cedula = @Numero_Cedula AND id_Empleado != @id_Empleado)
    BEGIN
        UPDATE Tbl_Empleado
        SET Nombre_Empleado = @Nombre_Empleado,
            Direccion = @Direccion,
            Numero_Cedula = @Numero_Cedula,
            Telefono = @Telefono
        WHERE id_Empleado = @id_Empleado;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarProducto]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_ModificarProducto]( 
@IdProducto int, 
@NombreProd  varchar(50), 
@Descripcion varchar (50), 
@Categoria int, 
@Activo bit, 
@Resultado bit output 
) 
as  begin  
set @Resultado=1 
if not exists(select * from Tbl_Producto where Nombre_Producto=@NombreProd and id_Producto !=@IDProducto)  	update Tbl_Producto set  
 	Nombre_Producto=@NombreProd,  	Descripcion=@Descripcion,  	id_Categoria=@Categoria,  	Estado=@Activo  	where id_Producto=@IDProducto 
else  
 	set @Resultado=0; 
end 
GO
/****** Object:  StoredProcedure [dbo].[USP_ModificarVenta]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ModificarVenta](
    @id_Venta INT,
    @id_Empleado INT,
    @fecha_Venta DATETIME2,
    @IVA DECIMAL(10, 2),
    @Descuento DECIMAL(10, 2),
    @Subtotal_Venta DECIMAL(10, 2),
    @Total DECIMAL(15, 2),
    @Resultado BIT OUTPUT
)
AS
BEGIN
    SET @Resultado = 1;

    IF EXISTS (SELECT * FROM Tbl_Venta WHERE id_Venta = @id_Venta)
    BEGIN
        UPDATE Tbl_Venta
        SET id_Empleado = @id_Empleado,
            fecha_Venta = @fecha_Venta,
            IVA = @IVA,
            Descuento = @Descuento,
            Subtotal_Venta = @Subtotal_Venta,
            Total = @Total
        WHERE id_Venta = @id_Venta;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ObtenerClientes]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ObtenerClientes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id_Cliente, Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente
    FROM Tbl_Cliente;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ObtenerDescartados]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ObtenerDescartados]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT id_Descartado, Nombre
    FROM Tbl_Descartado;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ObtenerDevoluciones]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ObtenerDevoluciones]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT id_Devolucion, Fecha_Devolucion, Nombre, Descripcion FROM Tbl_Devolucion;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ObtenerEmpleados]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ObtenerEmpleados]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT id_Empleado, Nombre_Empleado, Direccion, Numero_Cedula, Telefono
    FROM Tbl_Empleado;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ProductoEliminar]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_ProductoEliminar] 
@cod int, 
@Resultado bit output AS begin  
set @Resultado =1 set nocount on; 
If Exists(select id_Producto from Tbl_Producto where id_Producto=@cod)  	delete from Tbl_Producto where id_Producto=@cod 
else  
 	set @Resultado=0 
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_ProductoObtener]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ProductoObtener] 
AS 
BEGIN 
    SET NOCOUNT ON; 
     
    SELECT         id_Producto, 
        Nombre_Producto,         Descripcion,         id_Categoria, 
        Estado, 
        (SELECT Nombre_Categoria FROM Tbl_Categoria WHERE id_Categoria = Tbl_Producto.id_Categoria) as Nombre_Categoria 
    FROM 
        Tbl_Producto; 
END 
GO
/****** Object:  StoredProcedure [dbo].[USP_ProveedoresObtener]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ProveedoresObtener]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id_Proveedor, nombre, direccion, telefono, email, estado 
    FROM Tbl_Proveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarBodega]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarBodega]
    @Nombre_Bodega varchar(50),
    @Ubicacion varchar(50),
    @Estado varchar(50),
    @Resultado bit OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Tbl_Bodega WHERE Nombre_Bodega = @Nombre_Bodega)
    BEGIN
        INSERT INTO Tbl_Bodega (Nombre_Bodega, Ubicacion, Estado)
        VALUES (@Nombre_Bodega, @Ubicacion, @Estado);

        SET @Resultado = 1; -- Bodega registrada con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Bodega con el mismo nombre ya existe
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarCategoria]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[USP_RegistrarCategoria]( 
@Nombre varchar(50), 
@Descripcion varchar(50), 
@Resultado bit output 
) 
as begin  
 	set @Resultado=1 
 	If NOT EXISTS (select * From Tbl_Categoria where Nombre_Categoria = @Nombre)  	insert into Tbl_Categoria(Nombre_Categoria,Descripcion) values ( 
 	@Nombre,@Descripcion 
 	) 
 	else 
 	set @Resultado=0 
end 
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarCliente]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarCliente]
    @Nombre_Cliente VARCHAR(50),
    @Direccion_Cliente VARCHAR(90),
    @Telefono_Cliente VARCHAR(50),
    @Email_Cliente VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Tbl_Cliente WHERE Email_Cliente = @Email_Cliente)
    BEGIN
        INSERT INTO Tbl_Cliente (Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente)
        VALUES (@Nombre_Cliente, @Direccion_Cliente, @Telefono_Cliente, @Email_Cliente);

        SET @Resultado = 1; -- Cliente registrado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Cliente con el mismo email ya existe
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarDescartado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarDescartado]
    @Nombre VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Tbl_Descartado WHERE Nombre = @Nombre)
    BEGIN
        INSERT INTO Tbl_Descartado (Nombre)
        VALUES (@Nombre);

        SET @Resultado = 1; -- Registro insertado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Registro con el mismo nombre ya existe
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarDevolucion]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarDevolucion]
    @Fecha_Devolucion VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(50),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    IF NOT EXISTS (SELECT 1 FROM Tbl_Devolucion WHERE Nombre = @Nombre AND Fecha_Devolucion = @Fecha_Devolucion)
    BEGIN
        INSERT INTO Tbl_Devolucion (Fecha_Devolucion, Nombre, Descripcion)
        VALUES (@Fecha_Devolucion, @Nombre, @Descripcion);
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Registro con el mismo nombre y fecha ya existe
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarEmpleado]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarEmpleado] (
    @Nombre_Empleado varchar(50),
    @Direccion varchar(50),
    @Numero_Cedula varchar(50),
    @Telefono varchar(50),
    @Resultado bit OUTPUT
)
AS
BEGIN
    SET @Resultado = 1;
    IF NOT EXISTS (SELECT * FROM Tbl_Empleado WHERE Numero_Cedula = @Numero_Cedula)
    BEGIN
        INSERT INTO Tbl_Empleado (Nombre_Empleado, Direccion, Numero_Cedula, Telefono)
        VALUES (@Nombre_Empleado, @Direccion, @Numero_Cedula, @Telefono);
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarProducto]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_RegistrarProducto]( 
@Nombre varchar(50), 
@Descripcion varchar(50), 
@Categoria int, 
@Resultado bit output 
) 
as begin  
 	set @Resultado=1 
 	If NOT EXISTS (select * From Tbl_Producto where Nombre_Producto = @Nombre)  	insert into Tbl_Producto(Nombre_Producto,Descripcion,id_Categoria) values ( 
 	@Nombre,@Descripcion,@Categoria 
 	) 
 	else 
 	set @Resultado=0 
end 
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarProveedor]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarProveedor]
    @nombre VARCHAR(100),
    @direccion VARCHAR(200),
    @telefono VARCHAR(20),
    @email VARCHAR(100),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Tbl_Proveedor WHERE email = @email)
    BEGIN
        INSERT INTO Tbl_Proveedor (nombre, direccion, telefono, email)
        VALUES (@nombre, @direccion, @telefono, @email);

        SET @Resultado = 1; -- Proveedor registrado con éxito
    END
    ELSE
    BEGIN
        SET @Resultado = 0; -- Proveedor con el mismo email ya existe
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarUsuario]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarUsuario]
    @Nombre_Usuario varchar(245),
    @clave varchar(245),
    @Resultado bit OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Resultado = 1;

    -- Verificar si el usuario ya existe
    IF NOT EXISTS (SELECT * FROM usuario WHERE Nombre_Usuario = @Nombre_Usuario)
    BEGIN
        -- Insertar el nuevo usuario
        INSERT INTO usuario (Nombre_Usuario, clave)
        VALUES (@Nombre_Usuario, @clave);
    END
    ELSE
    BEGIN
        -- El usuario ya existe, no se puede insertar
        SET @Resultado = 0;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RegistrarVenta]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RegistrarVenta](
    @fecha_Venta DATETIME2,
    @IVA DECIMAL(10, 2),
    @Descuento DECIMAL(10, 2),
    @Subtotal_Venta DECIMAL(10, 2),
    @Total DECIMAL(15, 2),
    @Resultado BIT OUTPUT
)
AS
BEGIN
    SET @Resultado = 1;

    -- Insertar nueva venta
    INSERT INTO Tbl_Venta (fecha_Venta, IVA, Descuento, Subtotal_Venta, Total)
    VALUES (@fecha_Venta, @IVA, @Descuento, @Subtotal_Venta, @Total);
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_ValidarUsuario]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ValidarUsuario]
    @Nombre_Usuario varchar(245),
    @clave varchar(245),
    @Resultado bit OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializamos el resultado como 0 (falso)
    SET @Resultado = 0;

    -- Verificamos si existe un usuario con el nombre de usuario y clave proporcionados
    IF EXISTS (SELECT * FROM usuario WHERE Nombre_Usuario = @Nombre_Usuario AND clave = @clave)
    BEGIN
        SET @Resultado = 1;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_VentaEliminar]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VentaEliminar](
    @id_Venta INT,
    @Resultado BIT OUTPUT
)
AS
BEGIN
    SET @Resultado = 1;
    SET NOCOUNT ON;

    IF EXISTS (SELECT id_Venta FROM Tbl_Venta WHERE id_Venta = @id_Venta)
    BEGIN
        DELETE FROM Tbl_Venta WHERE id_Venta = @id_Venta;
    END
    ELSE
    BEGIN
        SET @Resultado = 0;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[USP_VentaObtener]    Script Date: 21/06/2024 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VentaObtener] 
AS 
BEGIN 
    SET NOCOUNT ON; 
     
    SELECT         
        v.id_Venta,
        v.id_Empleado,
        v.fecha_Venta,
        v.IVA,
        v.Descuento,
        v.Subtotal_Venta,
        v.Total,
        e.Nombre_Empleado
    FROM 
        Tbl_Venta v
    INNER JOIN
        Tbl_Empleado e ON v.id_Empleado = e.id_Empleado;
END;
GO
USE [master]
GO
ALTER DATABASE [Abarrotes] SET  READ_WRITE 
GO
