var tabladata;

$(document).ready(function () {

    // Inicialización de DataTable
    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": "/Cliente/Obtener",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id_Cliente" },
            { "data": "nombre_Cliente" },
            { "data": "direccion_Cliente" },
            { "data": "telefono_Cliente" },
            { "data": "email_Cliente" },
            {
                "data": "id_Cliente", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i>Editar</button>" +
                        "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i>Eliminar</button>";
                },
                "orderable": false,
                "searchable": false,
                "width": "80px"
            }
        ],
        "language": {
            "processing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "loadingRecords": "Cargando...",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            "buttons": {
                "copy": "Copiar",
                "colvis": "Visibilidad",
                "collection": "Colección",
                "colvisRestore": "Restaurar visibilidad",
                "copyKeys": "Presione ctrl o ⌘ + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                "copySuccess": {
                    "1": "Copiada 1 fila al portapapeles",
                    "_": "Copiadas %d filas al portapapeles"
                },
                "copyTitle": "Copiar al portapapeles",
                "csv": "CSV",
                "excel": "Excel",
                "pageLength": {
                    "-1": "Mostrar todas las filas",
                    "1": "Mostrar 1 fila",
                    "_": "Mostrar %d filas"
                },
                "pdf": "PDF",
                "print": "Imprimir"
            }
        },
        responsive: true
    });

    // Validación del formulario
    $("#form").validate({
        rules: {
            Nombre_Cliente: "required",
            Direccion_Cliente: "required",
            Telefono_Cliente: "required",
            Email_Cliente: {
                required: true,
                email: true
            }
        },
        messages: {
            Nombre_Cliente: "(Este campo es obligatorio)",
            Direccion_Cliente: "(Este campo es obligatorio)",
            Telefono_Cliente: "(Este campo es obligatorio)",
            Email_Cliente: {
                required: "(Este campo es obligatorio)",
                email: "(Debe ser un email válido)"
            }
        },
        errorElement: 'span'
    });

});

// Función para abrir el modal de edición/creación
function abrirPopUpForm(json) {
    $("#txtid").val(0); // Valor por defecto para nuevo registro

    if (json != null) {
        // Llenar los campos del formulario con los datos del cliente seleccionado
        $("#txtid").val(json.id_Cliente);
        $("#txtNombre_Cliente").val(json.nombre_Cliente);
        $("#txtDireccion_Cliente").val(json.direccion_Cliente);
        $("#txtTelefono_Cliente").val(json.telefono_Cliente);
        $("#txtEmail_Cliente").val(json.email_Cliente);
    } else {
        // Limpiar los campos del formulario para nuevo registro
        $("#txtNombre_Cliente").val("");
        $("#txtDireccion_Cliente").val("");
        $("#txtTelefono_Cliente").val("");
        $("#txtEmail_Cliente").val("");
    }

    $('#FormModal').modal('show'); // Mostrar el modal
}

// Función para guardar el cliente
function Guardar() {
    if ($("#form").valid()) { // Validar el formulario
        var request = {
            id_Cliente: parseInt($("#txtid").val()),
            nombre_Cliente: $("#txtNombre_Cliente").val(),
            direccion_Cliente: $("#txtDireccion_Cliente").val(),
            telefono_Cliente: $("#txtTelefono_Cliente").val(),
            email_Cliente: $("#txtEmail_Cliente").val()
        };

        $.ajax({
            url: "/Cliente/Guardar", // Endpoint para guardar/actualizar cliente
            type: "POST",
            data: request,
            success: function (data) {
                if (data.resultado) {
                    tabladata.ajax.reload(); // Recargar DataTable después de guardar/actualizar
                    $('#FormModal').modal('hide'); // Cerrar modal
                } else {
                    Swal.fire("Mensaje", "No se pudo guardar los cambios", "warning");
                }
            },
            error: function (error) {
                console.log(error);
                Swal.fire("Error", "Ocurrió un error al guardar", "error");
            }
        });
    }
}

// Función para eliminar cliente
function eliminar(idCliente) {
    Swal.fire({
        title: '¿Está seguro de eliminar el registro?',
        text: "Esta acción no podrá revertirse!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, Eliminarlo',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "/Cliente/Eliminar?id=" + idCliente, // Endpoint para eliminar cliente
                type: "DELETE",
                dataType: "json",
                success: function (data) {
                    if (data.resultado) {
                        tabladata.ajax.reload(); // Recargar DataTable después de eliminar
                        Swal.fire('¡Eliminado!', 'El registro ha sido eliminado.', 'success');
                    } else {
                        Swal.fire("Error", "No se pudo eliminar el registro", "error");
                    }
                },
                error: function (error) {
                    console.log(error);
                    Swal.fire("Error", "Ocurrió un error al intentar eliminar el registro", "error");
                }
            });
        }
    });
}
