function SuaBaoCao() {
	var IdBaoCao = $("#hIdBaoCao").val();
	var tgbd = $("#tgbd").val(); //HH:mm
	var tgkt = $("#tgkt").val(); //'HH:mm:ss')
	var _NgayBaoCao = $("#datepicker").val();
	var ThoiGianBatDau = _NgayBaoCao + ' ' + tgbd;
	var ThoiGianKetThuc = _NgayBaoCao + ' ' + tgkt;
	var PhanTramHoanThanh;
	var GhiChu = $("#ghichu").val();
	var IdTrangThai;
	//var Ngaybc = kendo.toString(_NgayBaoCao, "dd/MM/yyyy HH:mm:ss");

	if ($("#dahoanthanh").is(":checked")) {
		IdTrangThai = 5;
		PhanTramHoanThanh = 100;
	} else {
		IdTrangThai = 4;
		PhanTramHoanThanh = $("#phantramhoanthanh").val();
	}
	// validate
	if (!ValidateThoiGianThucHienCongViecSua(ThoiGianBatDau, ThoiGianKetThuc, IdBaoCao)) {
		alert("Thời gian thực hiện công việc bị trùng với công việc khác.");
	}
	else if (tgbd.length == 0 || tgkt.length == 0 || _NgayBaoCao.length == 0) {
		alert("Vui lòng điền đầy đủ thông tin");
	}
	else if (_NgayBaoCao > new Date()) {
		alert("Ngày báo cáo không được lớn hơn ngày hiện tại");
	}
	else if (tgbd > tgkt || tgbd == tgkt) {
		alert("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
	}
	else {
		$.ajax({
			type: "POST",
			url: "/ProductDevelopment/BaoCaoCongViecNgay/SuaBaoCao",//make sure url exist
			data: "{IdBaoCao:'" + IdBaoCao +
				"', NgayBaoCao: '" + _NgayBaoCao +
				"', ThoiGianBatDau:'" + ThoiGianBatDau +
				"', ThoiGianKetThuc:'" + ThoiGianKetThuc +
				"', PhanTramHoanThanh:'" + PhanTramHoanThanh +
				"', IdTrangThai:'" + IdTrangThai +
				"', GhiChu:'" + GhiChu + "'}",//pass data to action
			//data: "{IdGiaoViec:1}",//pass data to action
			async: false,
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (data) {
				if (data.State == 0) {
					alert("Sửa báo cáo thành công");
					var datepicker = $("#datepicker").data("kendoDatePicker");
					reloadTimeline(kendo.toString(datepicker.value(), 'dd/MM/yyyy'));
					$("#window").data("kendoWindow").close();
				}
				else {
					alert("Sửa báo cáo không thành công");
				}
			},
			error: function (data) {
				alert("Sửa báo cáo không thành công", data.Message);
			}
		});
	}
}
