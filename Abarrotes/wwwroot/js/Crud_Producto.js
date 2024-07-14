
var tabladataP;
$(document).ready(function () {

    //validamos el formulario
    $("#form").validate({
        rules: {
            Nombre_Producto: "required"
        },
        messages: {
            Nombre_Producto: "(Este campo obligatorio)"

        },
        errorElement: 'span'
    });

    jQuery.ajax({
        url: "/Categoria/Obtener",
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $("#ddlCategoria").html("");
            if (data.data != null) {
                $.each(data.data, function (i, item) {
                    if (item.estado == true) {
                        $("<option>").attr({ "value": item.id_Categoria }).text(item.nombre_Categoria).appendTo("#ddlCategoria")
                    }

                })
                $("#ddlCategoria").val($("#ddlCategoria option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {

        },
    });


    tabladataP = $('#tbdata').DataTable({
        "ajax": {
            "url": "/Producto/Obtener",
            "type": "GET",
            "datatype": "json"
        },
      
        "columns": [
            { "data": "id_Producto"},
            { "data": "nombre_Producto"},
            { "data": "descripcion"},
            {
                "data": "objCategoria", render: function(data){
                    return data.nombre_Categoria 
                }
            },
            {
                "data": "estado", "render": function (data) {
                    if (data) {
                        return '<span class="btn-success btn-sm ml-2">Activo</span>'
                    }
                    else{
                        return '<span class="btn-warning btn-sm ml-2">Inactivo</span>'
                    }
                        

                },"width":"10%"
            },
            {
                "data": "id_Producto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpFormP(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i>Editar</button>" +
                        "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i>Eliminar</button>" 
                },
                "orderable": false,
                "searchable": false,
                "width": "60px"
            }

        ], "language": {
            "processing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningun dato disponible en esta tabla",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "infoThousands": ",",
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
                "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                "copySuccess": {
                    "1": "Copiada 1 fila al portapapeles",
                    "_": "Copiadas %d fila al portapapeles"
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
            },
            "autoFill": {
                "cancel": "Cancelar",
                "fill": "Rellene todas las celdas con <i>%d<\/i>",
                "fillHorizontal": "Rellenar celdas horizontalmente",
                "fillVertical": "Rellenar celdas verticalmentemente"
            },
            "decimal": ",",
            "searchBuilder": {
                "add": "Añadir condición",
                "button": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "clearAll": "Borrar todo",
                "condition": "Condición",
                "conditions": {
                    "date": {
                        "after": "Despues",
                        "before": "Antes",
                        "between": "Entre",
                        "empty": "Vacío",
                        "equals": "Igual a",
                        "notBetween": "No entre",
                        "notEmpty": "No Vacio",
                        "not": "Diferente de"
                    },
                    "number": {
                        "between": "Entre",
                        "empty": "Vacio",
                        "equals": "Igual a",
                        "gt": "Mayor a",
                        "gte": "Mayor o igual a",
                        "lt": "Menor que",
                        "lte": "Menor o igual que",
                        "notBetween": "No entre",
                        "notEmpty": "No vacío",
                        "not": "Diferente de"
                    },
                    "string": {
                        "contains": "Contiene",
                        "empty": "Vacío",
                        "endsWith": "Termina en",
                        "equals": "Igual a",
                        "notEmpty": "No Vacio",
                        "startsWith": "Empieza con",
                        "not": "Diferente de"
                    },
                    "array": {
                        "not": "Diferente de",
                        "equals": "Igual",
                        "empty": "Vacío",
                        "contains": "Contiene",
                        "notEmpty": "No Vacío",
                        "without": "Sin"
                    }
                },
                "data": "Data",
                "deleteTitle": "Eliminar regla de filtrado",
                "leftTitle": "Criterios anulados",
                "logicAnd": "Y",
                "logicOr": "O",
                "rightTitle": "Criterios de sangría",
                "title": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "value": "Valor"
            },
            "searchPanes": {
                "clearMessage": "Borrar todo",
                "collapse": {
                    "0": "Paneles de búsqueda",
                    "_": "Paneles de búsqueda (%d)"
                },
                "count": "{total}",
                "countFiltered": "{shown} ({total})",
                "emptyPanes": "Sin paneles de búsqueda",
                "loadMessage": "Cargando paneles de búsqueda",
                "title": "Filtros Activos - %d"
            },
            "select": {
                "1": "%d fila seleccionada",
                "_": "%d filas seleccionadas",
                "cells": {
                    "1": "1 celda seleccionada",
                    "_": "$d celdas seleccionadas"
                },
                "columns": {
                    "1": "1 columna seleccionada",
                    "_": "%d columnas seleccionadas"
                }
            },
            "thousands": ".",
            "datetime": {
                "previous": "Anterior",
                "next": "Proximo",
                "hours": "Horas",
                "minutes": "Minutos",
                "seconds": "Segundos",
                "unknown": "-",
                "amPm": [
                    "am",
                    "pm"
                ]
            },
            "editor": {
                "close": "Cerrar",
                "create": {
                    "button": "Nuevo",
                    "title": "Crear Nuevo Registro",
                    "submit": "Crear"
                },
                "edit": {
                    "button": "Editar",
                    "title": "Editar Registro",
                    "submit": "Actualizar"
                },
                "remove": {
                    "button": "Eliminar",
                    "title": "Eliminar Registro",
                    "submit": "Eliminar",
                    "confirm": {
                        "_": "¿Está seguro que desea eliminar %d filas?",
                        "1": "¿Está seguro que desea eliminar 1 fila?"
                    }
                },
                "error": {
                    "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
                },
                "multi": {
                    "title": "Múltiples Valores",
                    "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
                    "restore": "Deshacer Cambios",
                    "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
                }
            }
        },
        responsive: true
    });


})

function abrirPopUpFormP(json) {


    $("#txtid").val(0);

    if (json != null) {

        $("#txtid").val(json.id_Producto);
        $("#txtNombre_Producto").val(json.nombre_Producto);
        $("#txtDescripcion").val(json.descripcion);
        $("#ddlCategoria").val(json.id_Categoria);
        $("#cboEstado").val(json.estado == true ? 1 : 0);
        $("#txtid").prop("disabled", true)

    } else {

        $("#txtid").val("AUTOGENERADO");
        $("#txtid").prop("disabled", true)
        $("#txtNombre_Producto").val("");
        $("#txtDescripcion").val("");
        $("#ddlCategoria").val($("#ddlCategoria option:first").val());

        $("#cboEstado").val();

    }

    $('#FormModal').modal('show');

}
function Guardar() {

    if ($("#form").valid()) {

        var request = {
            objeto: {
                id_Producto: parseInt($("#txtid").val()),
                nombre_Producto: $("#txtNombre_Producto").val(),
                descripcion: ($("#txtDescripcion").val() != "" ? $("#txtDescripcion").val() : ""),
                id_Categoria: $("#ddlCategoria").val(),
                estado: ($("#cboEstado").val() == "1" ? true : false)
            }

        }
        jQuery.ajax({
            url: "/Producto/Guardar",
            type: "POST",
            data: request,
            success: function (data) {

                if (data.resultado) {
                    tabladataP.ajax.reload();
                    $('#FormModal').modal('hide');
                } else {

                    Swal.fire("Mensaje", "No se pudo guardar los cambios", "warning")
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {

            },
        });

    }

}


function eliminar(idProducto) {
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
            // Hacer la solicitud AJAX para eliminar el registro
            jQuery.ajax({
                url: "/Producto/Eliminar?id=" + idProducto,
                type: "DELETE",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.resultado) {
                        // Recargar la tabla después de eliminar el registro
                        tabladataP.ajax.reload();
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


function abrirPopUpForm(json) {


    $("#txtidc").val(0);

    if (json != null) {

        $("#txtidc").val(json.id_Categoria);
        $("#txtNombre_Categoria").val(json.nombre_Categoria);
        $("#txtDescripcionc").val(json.descripcion);
        $("#cboEstadoc").val(json.estado == true ? 1 : 0);

    } else {
        $("#txtNombre_Categoria").val("");
        $("#txtDescripcionc").val("");
        $("#cboEstadoc").val();
    }

    $('#FormModalC').modal('show');

}
function GuardarCat() {

    if ($("#formc").valid()) {
        var request = {
            id_categoria: parseInt($("#txtidc").val()),
            nombre_categoria: $("#txtNombre_Categoria").val(),
            descripcion: ($("#txtDescripcionc").val() != "" ? $("#txtDescripcionc").val() : ""),
            estado: ($("#cboEstadoc").val() == "1" ? true : false)

        }
        jQuery.ajax({
            url: "/Producto/GuardarCat",
            type: "POST",
            data: request,
            success: function (data) {

                if (data.resultado) {
                    tabladataP.ajax.reload();
                    $('#FormModalC').modal('hide');
                } else {

                    Swal.fire("Mensaje", "No se pudo guardar los cambios", "warning")
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {

            },
        });

    }

}

