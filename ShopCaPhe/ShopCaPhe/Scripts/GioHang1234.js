﻿$(document).ready(function () {
    DatHang = function (MaSP) {
        var SL = $('#txtSL').val();
        if (SL < 0) {
            alert("Số lượng sản phẩm không được âm, Vui lòng nhập lại số lượng sản phẩm!");


        }
        else if ((parseInt($('#txtSL').val()) > parseInt($('#soluongton').val())))
            {
                alert("Số lượng mua không được vượt quá số lượng tồn kho, vui lòng nhập lại");
            }
            else {
                if (isNaN(SL) == true) {
                    SL = 1;
                }
                var id = $('#username').html();
                var id1 = $('#username1').html();
            if (id == "" && id1 == "") {
                alert("Bạn cần đăng nhập để thực hiện chức năng này !");
                location.href = "/Account/LoginSSO";
            }
            else {
                $.ajax({
                    url: "/GioHang/ThemGiohang",
                    data: { iMaSP: MaSP, SL: SL },
                    type: "POST",
                    success: function (result) {
                        var TongSL = 0;
                        var TongTien = 0;

                        $.each(result, function (i, item) {
                            TongSL += item.SoLuongMua;
                            TongTien += item.TongTien
                        });
                        //$('#cart > a  > span').html(TongSL + " Sản Phẩm - " + TongTien + "VND")
                        $('.rightz > span').html("<p style='color:red; display:inline-block;padding:0;margin:0;'>" + TongSL + "</p> Sản phẩm - <p style='color:red;display:inline-block;padding:0;margin:0;'>" + TongTien + "</p> VNĐ")

                        alert('Đặt Hàng Thành Công!!')


                    }
                });
                return false;
            }
        }
    };

    Poppup = (function (MaSP) {
   
        $.ajax({
            url: "/Home/Popup",
            data: { iMaSP: MaSP },
            type: "GET",
            dataType: "json",
            contentType: "Student",
            success: function (result) {
                var item = "";
                $('.modal-body').empty();

                var hinh = result.hinhminhhoa;
                var R =
                    "<div class='left'>"
                    + "<img src = '/Images/"+hinh+"'/>"
                    + "<div class='right'>"
                    + "<p id='pname'>" + result.name + "</p>"
                    + "<p><strong>Đơn giá:</strong> "+result.price+".VNĐ </p>"
                    + "<p><strong>Đơn vị tính:</strong> "+result.donvitinh +"</p>"
                    + "<p id='popupmota'><strong>Số lượng:</strong> "+ result.soluong +"</p>"
                    + "<p><strong>Trạng thái:</strong> " + result.trangthai + "</p>"
                    + "<button id='popupbutton' onclick='DatHang(" + result.masp + ")'>Thêm vào giỏ hàng</button> Hoặc <a href='/ViewSP/ChiTietSanPham?MaSP=" + result.masp + "'>Xem chi tiết</a>"
                    +"</div>"


                $('.modal-body').append(R);
                modelz.style.display = "block";

            }
        });
        return false;
    });

    CapNhat = (function (MaSP) {
        SL = $("#" + MaSP).val();
        if (isNaN(SL) == true || SL < 0 || SL == "") {
            SL = 1; 
        }
        var TongTien1 = 0;
        var VAT = $('#magiam').text();
        var TongSL1 = 0
        $.ajax({
            url: "/GioHang/ThemGiohang",
            data: { iMaSP: MaSP, SL: SL },
            type: "POST",
            success: function (result) {
                if (result == 1) {
                    alert("Sản phẩm đặt mua vượt quá sản phẩm trong kho hàng, vui lòng nhập lại số lượng hoặc liên hệ với quản trị viên");
                }
                else {
                    if (VAT == " ") {
                        var item = "";
                        $('.Cart-info tbody').empty();
                        $.each(result, function (i, item) {
                            var R = "<tr>"
                                + "<td><input disabled  type='text' value=" + item.MaSP + " id='MaSach' name='MaSach'></td>"
                                + "<td><a href='/ViewSach/ChiTietSach?MaSach=@item.MaSP'><img src='/Images/" + item.HinhMinhHoa + "' /></a></td>"
                                + "<td>" + item.TenSP + "</td>"
                                + "<td><input type='number' min='0' max='" + item.SoLuong + "' id='" + item.MaSP + "' class='txtSLGH' value=" + item.SoLuongMua + " /><a class='fa fa-upload btn-Update' onclick='CapNhat(" + item.MaSP + ")' aria-hidden='true'></a><a  class='fa fa-trash-o btn-Delete' aria-hidden='true' onclick=' XoaSP(" + item.MaSP + ")'></a></td>"
                                + "<td>" + item.DonGia + "</td>"
                                + "<td>" + item.TongTien + "</td>"
                                + "</tr>"
                            TongTien1 += item.TongTien;
                            TongSL1 += item.SoLuongMua;
                            $('.Cart-info tbody').append(R);
                        });
                        TongTien1 = TongTien1 - TongTien1 * VAT / 100;
                        var tong = numeral(TongTien1).format('0,0');
                        $('.TongTien > h2 > span').html(tong)
                        //$('#cart > a  > span').html(TongSL1 + " Sản Phẩm - " + TongTien1 + "VND")
                        $('.rightz > span').html("<p style='color:red; display:inline-block;padding:0;margin:0;'>" + TongSL1 + "</p> Sản phẩm - <p style='color:red;display:inline-block;padding:0;margin:0;'>" + tong + "</p> VNĐ")

                        $('#tongtien').html(tong)
                    }
                    else {
                        var item = "";
                        $('.Cart-info tbody').empty();
                        $.each(result, function (i, item) {
                            var R = "<tr>"
                                + "<td><input disabled  type='text' value=" + item.MaSP + " id='MaSach' name='MaSach'></td>"
                                + "<td><a href='/ViewSach/ChiTietSach?MaSach=@item.MaSP'><img src='/Images/" + item.HinhMinhHoa + "' /></a></td>"
                                + "<td>" + item.TenSP + "</td>"
                                + "<td><input type='number' min='0' max='" + item.SoLuong + "' id='" + item.MaSP + "' class='txtSLGH' value=" + item.SoLuongMua + " /><a class='fa fa-upload btn-Update' onclick='CapNhat(" + item.MaSP + ")' aria-hidden='true'></a><a  class='fa fa-trash-o btn-Delete' aria-hidden='true' onclick=' XoaSP(" + item.MaSP + ")'></a></td>"
                                + "<td>" + item.DonGia + "</td>"
                                + "<td>" + item.TongTien + "</td>"
                                + "</tr>"
                            TongTien1 += item.TongTien;
                            TongSL1 += item.SoLuongMua;
                            $('.Cart-info tbody').append(R);
                        });
                        var tong = numeral(TongTien1).format('0,0');
                        $('.TongTien > h2 > span').html(tong)
                        //$('#cart > a  > span').html(TongSL1 + " Sản Phẩm - " + TongTien1 + "VND")
                        $('.rightz > span').html("<p style='color:red; display:inline-block;padding:0;margin:0;'>" + TongSL1 + "</p> Sản phẩm - <p style='color:red;display:inline-block;padding:0;margin:0;'>" + tong + "</p> VNĐ")

                        $('#tongtien').html(tong)
                    }
                    
                }
            }
        });


        return false;

    });
    XoaSP = (function (MaSP) {
        $.ajax({
            url: "/GioHang/XoaSP",
            data: { iMaSP: MaSP },
            type: "POST",
            success: function (result) {
                var item = "";
                var TongTien = 0;
                var TongSL2 = 0;
                $('.Cart-info tbody').empty();
                $.each(result, function (i, item){
                    var R = "<tr>"
                        + "<td><input disabled  type='text' value=" + item.MaSP + " id='MaSach' name='MaSach'></td>"
                        + "<td><a href='/ViewSach/ChiTietSach?MaSach=@item.MaSP'><img src='/Images/" + item.HinhMinhHoa + "' /></a></td>"
                        + "<td>" + item.TenSP + "</td>"
                        + "<td><input type='text' id='" + item.MaSP + "' class='txtSLGH' value=" + item.SoLuongMua + " /><a class='fa fa-upload btn-Update' onclick='CapNhat(" + item.MaSP + ")' aria-hidden='true'></a><a  class='fa fa-trash-o btn-Delete' aria-hidden='true' onclick=' XoaSP(" + item.MaSP + ")'></a></td>"
                        + "<td>" + item.DonGia + "</td>"
                        + "<td>" + item.TongTien + "</td>"
                        + "</tr>"
                    TongTien += item.TongTien
                    TongSL2 += item.SoLuongMua
                    $('.Cart-info tbody').append(R);

                });
                $('.TongTien > h2 > span').html(TongTien)
                $('.rightz > span').html("<p style='color:red; display:inline-block;padding:0;margin:0;'>" + TongSL2 + "</p> Sản phẩm - <p style='color:red;display:inline-block;padding:0;margin:0;'>" + TongTien + "</p> VNĐ")
              $('#tongtien').html(TongTien)
            },
        });
        return false;
    });
    tai = function () {
        alert("Load lại")
    };
});
