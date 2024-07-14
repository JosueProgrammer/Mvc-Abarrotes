var tabladata;
$(document).ready(function () {

    // Validamos el formulario
    $("#form").validate({
        rules: {
            nombre: "required"
        },
        messages: {
            nombre: "(Este campo es obligatorio)"
        },
        errorElement: 'span'
    });

    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": "/Proveedor/Obtener",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id_Proveedor" },
            { "data": "nombre" },
            { "data": "direccion" },
            { "data": "telefono" },
            { "data": "email" },
            {
                "data": "estado", "render": function (data) {
                    if (data) {
                        return '<span class="btn-success btn-sm ml-2">Activo</span>'
                    } else {
                        return '<span class="btn-warning btn-sm ml-2">Inactivo</span>'
                    }
                }, "width": "10%"
            },
            {
                "data": "id_Proveedor", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i> Editar</button>" +
                        "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i> Eliminar</button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "60px"
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
            }
        },
        responsive: true
    });

});

function abrirPopUpForm(json) {
    $("#txtid").val(0);

    if (json != null) {
        $("#txtid").val(json.id_Proveedor);
        $("#txtNombre").val(json.nombre);
        $("#txtDireccion").val(json.direccion);
        $("#txtTelefono").val(json.telefono);
        $("#txtEmail").val(json.email);
        $("#cboEstado").val(json.estado == true ? 1 : 0);
    } else {
        $("#txtNombre").val("");
        $("#txtDireccion").val("");
        $("#txtTelefono").val("");
        $("#txtEmail").val("");
        $("#cboEstado").val(1);
    }

    $('#FormModal').modal('show');
}

function Guardar() {
    if ($("#form").valid()) {
        var request = {
            id_Proveedor: parseInt($("#txtid").val()),
            nombre: $("#txtNombre").val(),
            direccion: ($("#txtDireccion").val() != "" ? $("#txtDireccion").val() : ""),
            telefono: ($("#txtTelefono").val() != "" ? $("#txtTelefono").val() : ""),
            email: ($("#txtEmail").val() != "" ? $("#txtEmail").val() : ""),
            estado: ($("#cboEstado").val() == "1" ? true : false)
        };

        jQuery.ajax({
            url: "/Proveedor/Guardar",
            type: "POST",
            data: JSON.stringify(request),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                } else {
                    Swal.fire("Mensaje", "No se pudo guardar los cambios", "warning");
                }
            },
            error: function (error) {
                console.log(error);
            },
            beforeSend: function () { }
        });
    }
}

function eliminar(idProveedor) {
    Swal.fire({
        title: '¿Está seguro de eliminar el registro?',
        text: "Esta acción no podrá revertirse!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminarlo',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            // Hacer la solicitud AJAX para eliminar el registro
            jQuery.ajax({
                url: "/Proveedor/Eliminar?id=" + idProveedor,
                type: "DELETE",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.resultado) {
                        // Recargar la tabla después de eliminar el registro
                        tabladata.ajax.reload();
                        Swal.fire(
                            '¡Eliminado!',
                            'El registro ha sido eliminado.',
                            'success'
                        );
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
