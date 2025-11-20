JSON.parse = JSON.parse || function (str) {
    if (str === "")
        str = '""';
    eval("var p=" + str + ";");
    return p;
}


$(document).ready(function () {

    $('#btn-met-clave').on('click', function () {
        abrirSolo('#multiCollapse-1');
    });

    $('#btn-met-leidos-todo').on('click', function () {
        abrirSolo('#multiCollapse-2');
    });
    $('#btn-met-leidos-30dias').on('click', function () {
        abrirSolo('#multiCollapse-3');
    });

    $('#btn-met-vistas-anios').on('click', function () {
        abrirSolo('#multiCollapse-4');
    });

    $('#btn-met-vistas-meses').on('click', function () {
        abrirSolo('#multiCollapse-5');
    });

    $('#btn-met-vistas-30dias').on('click', function () {
        abrirSolo('#multiCollapse-6');
    });

    $('.btn-collapse').on('click', function () {
        // 1. Remover estilo de todos los botones
        $('.btn-collapse').removeClass('btn-danger text-dark').addClass('btn-outline-primary');

        // 2. Agregar estilo al botón clicado
        $(this).addClass('btn-danger text-dark').removeClass('btn-outline-primary');
        // console.log("Botón clicado:", this);
    });

   

        $('#btn-met-clave').click()
});


function abrirSolo(idAbrir) {
    const todos = ['#multiCollapse-1', '#multiCollapse-2', '#multiCollapse-3', '#multiCollapse-4', '#multiCollapse-5', '#multiCollapse-6'];

    todos.forEach(function (id) {
        if (id === idAbrir) {
            $(id).collapse('show'); // abrir el que quiero
            $(id).collapse('show'); // abrir el que quiero
        } else {
            $(id).collapse('hide'); // cerrar los otros
        }
    });
}