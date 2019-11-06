$('#btntimkiem').on('click', function () {
    var giatrinhapvao = $('#searchcontent').val();
    alert("yeu");
    window.location.href = "/Home/timkiem?name=" + giatrinhapvao;
});
