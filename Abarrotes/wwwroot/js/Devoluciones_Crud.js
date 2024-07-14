var tabladata;

$(document).ready(function () {

    $("#form").validate({
        rules: {
            txtFecha_Devolucion: "required",
            txtNombre: "required",
            txtDescripcion: "required"
        },
        messages: {
            txtFecha_Devolucion: "(Este campo es obligatorio)",
            txtNombre: "(Este campo es obligatorio)",
            txtDescripcion: "(Este campo es obligatorio)"
        },
        errorElement: 'span'
    });

    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": "/Devolucion/Obtener",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id_Devolucion" },
            { "data": "fecha_Devolucion" },
            { "data": "nombre" },
            { "data": "descripcion" },
            {
                "data": "id_Devolucion", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i> Editar</button>" +
                        "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i> Eliminar</button>";
                },
                "orderable": false,
                "searchable": false,
                "width": "60px"
            }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
        },
        responsive: true
    });

});

function abrirPopUpForm(json) {
    $("#txtid").val(0);

    if (json != null) {
        $("#txtid").val(json.id_Devolucion);
        $("#txtFecha_Devolucion").val(json.Fecha_Devolucion);
        $("#txtNombre").val(json.Nombre);
        $("#txtDescripcion").val(json.Descripcion);
    } else {
        $("#txtFecha_Devolucion").val("");
        $("#txtNombre").val("");
        $("#txtDescripcion").val("");
    }

    $('#FormModal').modal('show');
}

function Guardar() {
    if ($("#form").valid()) {
        var idDevolucion = ($("#txtid").val() != "") ? parseInt($("#txtid").val()) : 0;
        var request = {
            id_Devolucion: idDevolucion,
            Fecha_Devolucion: $("#txtFecha_Devolucion").val(),
            Nombre: $("#txtNombre").val(),
            Descripcion: $("#txtDescripcion").val()
        };

        jQuery.ajax({
            url: "/Devolucion/Guardar",
            type: "POST",
            data: request,
            success: function (data) {
                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                    Swal.fire("Mensaje", "Devolución registrada exitosamente", "success");
                } else {
                    Swal.fire("Mensaje", "No se pudo guardar los cambios", "warning");
                }
            },
            error: function (error) {
                console.log(error);
                Swal.fire("Error", "Ocurrió un error al intentar guardar los cambios", "error");
            }
        });
    }
}

function eliminar(idDevolucion) {
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
            jQuery.ajax({
                url: "/Devolucion/Eliminar?id=" + idDevolucion,
                type: "DELETE",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.resultado) {
                        tabladata.ajax.reload();
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
