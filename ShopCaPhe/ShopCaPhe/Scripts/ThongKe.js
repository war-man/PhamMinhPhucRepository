Thongke = (function () {
    var year = document.getElementById("year");
    var month = document.getElementById("month");
    var yearitem = year.options[year.selectedIndex].text;
    var monthitem = month.options[month.selectedIndex].text;
    window.location.href = "/Admin/ThongKe/ThongKe?imonth=" + monthitem + "&iyear=" + yearitem
        /// vi - vn /

    //$.ajax({
    //    url: "/ThongKe/ThongKe",
    //    data: { iyear: yearitem, imonth: monthitem },
    //    type: "POST",
    //    contentType: "Student",
    //    success: function (result) {

    //        $('.thongkehoadon').empty();

    //        var hinh = result.hinhminhhoa;
    //        var R =
    //            " < thead >"
    //            + "<tr>"
    //            + "<th>Mã hóa đơn</th>"
    //            + "<th>Mã khách hàng</th>"
    //            + "<th>Tên khách hàng</th>"
    //            + " <th>Điện thoại</th>"
    //            + "<th>Địa chỉ</th>"
    //            + "<th>Đơn giá</th>"
    //            + "<th>Ngày đặt</th>"
    //            + "<th>Ngày giao</th>"
    //            + "</tr>"
    //            + "</thead >"
    //            + "<tbody>"


    //            + "  <tr>"
    //            + " <td>" + result.madh + "</td>"
    //            + "<td>" + result.makh + "</td>"
    //            + " <td>" + result.tenkh + "</td>"
    //            + " <td>" + result.dienthoai + "</td>"
    //            + " <td>" + result.diachi + "</td>"
    //            + " <td>" + result.dongia + "</td>"
    //            + "<td>" + result.ngaydat + "</td>"
    //            + "<td>" + result.ngaygiao + "</td>"
    //            + " </tr>"
    //            + " }"

    //            + " </tbody>"
    //        "  < span > Tong Tien: " + result.x + "</span >"


    //        $('.thongkehoadon').append(R);

    //    }

    //});
    //return false;
});