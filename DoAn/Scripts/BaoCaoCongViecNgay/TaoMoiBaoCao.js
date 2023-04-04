function TaoMoiBaoCao() {
	validator = $("#window").kendoValidator().data("kendoValidator");
	if (!validator) {
		alert("Vui lòng nhập đầy đủ thông tin");
	}
	else {
		var IdGiaoViec = $("#tencongviecCoSan").val();
		var tgbd = $("#tgbd").val(); //HH:mm
		var tgkt = $("#tgkt").val(); //'HH:mm:ss')
		var _NgayBaoCao = $("#datepicker").val();
		//	console.log(_NgayBaoCao + ' ' + tgbd);

		var NgayGiao = kendo.toString($("#ngaygiao").val(), "dd/MM/yyyy HH:mm:ss");
		var ThoiGianBatDau = _NgayBaoCao + ' ' + tgbd;
		var ThoiGianKetThuc = _NgayBaoCao + ' ' + tgkt;
		var PhanTramHoanThanh
		var idNguoiGiao = $("#nguoigiao").val();
		var IdDuAn = $("#TenDuAn").val();
		var TenCongViec = $("#tencongviecTrucTiep").val();
		var GhiChu = $("#ghichu").val();
		var IdTrangThai
		if ($("#dahoanthanh").is(":checked")) {
			IdTrangThai = 5;
			PhanTramHoanThanh = 100;
		} else {
			IdTrangThai = 4;
			PhanTramHoanThanh = $("#phantramhoanthanh").val();
		}
		if ($("#CongViecCoSan").is(":checked")) {
			if (tgbd.length == 0 || tgkt.length == 0 || _NgayBaoCao.length == 0) {
				alert("Vui lòng điền đầy đủ thông tin");
			}
			else if (_NgayBaoCao > new Date()) {
				alert("Ngày báo cáo không được lớn hơn ngày hiện tại");
			}
			else if (tgbd > tgkt || tgbd == tgkt) {
				alert("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
			}
			else if (!ValidateThoiGianThucHienCongViecTaoMoi(ThoiGianBatDau, ThoiGianKetThuc)) {
				alert("Thời gian thực hiện công việc bị trùng với công việc khác.");
			}
			else {
				$.ajax({
					type: "POST",
					url: "/ProductDevelopment/BaoCaoCongViecNgay/TaoMoiBaoCao",//make sure url exist
					data: "{IdGiaoViec:'" + IdGiaoViec +
						"', ThoiGianBatDau:'" + ThoiGianBatDau +
						"', ThoiGianKetThuc:'" + ThoiGianKetThuc +
						"', NgayBaoCao:'" + _NgayBaoCao +
						"', PhanTramHoanThanh:'" + PhanTramHoanThanh +
						"', IdTrangThai:'" + IdTrangThai +
						"', GhiChu:'" + GhiChu + "'}",//pass data to action
					//data: "{IdGiaoViec:1}",//pass data to action
					async: false,
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (data) {
						if (data.State == 0) {
							alert("Tạo mới báo cáo thành công");
							var datepicker = $("#datepicker").data("kendoDatePicker");
							reloadTimeline(kendo.toString(datepicker.value(), 'dd/MM/yyyy'));
							$("#window").data("kendoWindow").close();
						}
						else {
							alert("Tạo mới không thành công");
						}
					},
					error: function (data) {
						alert("Tạo mới thất bại", data.Message);
					}
				});
			}

		} else {
			var ngaygiao = kendo.parseExactDate(NgayGiao, "dd/MM/yyyy HH:mm:ss");
			if (tgbd.length == 0 || tgkt.length == 0 || _NgayBaoCao.length == 0 || NgayGiao.length == 0 || TenCongViec.length == 0) {
				alert("Vui lòng điền đầy đủ thông tin");
			}
			else if (_NgayBaoCao > new Date()) {
				alert("Ngày báo cáo không được lớn hơn ngày hiện tại");
			}
			else if (tgbd > tgkt) {
				alert("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
			}

			else if (ngaygiao > new Date()) {
				alert("Ngày giao phải nhỏ hơn ngày hiện tại");
			}
			else if (!ValidateThoiGianThucHienCongViec(ThoiGianBatDau, ThoiGianKetThuc)) {
				alert("Thời gian thực hiện công việc bị trùng với công việc khác");
			}
			else {
				$.ajax({
					type: "POST",
					url: "/ProductDevelopment/BaoCaoCongViecNgay/TaoMoiCongViecGiaoTrucTiep",//make sure url exist

					data: "{IdDuAn:'" + IdDuAn +
						"', TenCongViec:'" + TenCongViec +
						"', ThoiGianBatDau:'" + ThoiGianBatDau +
						"', ThoiGianKetThuc:'" + ThoiGianKetThuc +
						"', NgayGiao:'" + NgayGiao +
						"', NgayBaoCao:'" + _NgayBaoCao +
						"', idNguoiGiao:'" + idNguoiGiao +
						"', PhanTramHoanThanh:'" + PhanTramHoanThanh +
						"', IdGiaoViec:'" + IdGiaoViec +
						"', GhiChu:'" + GhiChu + "'}",//pass data to action

					async: false,
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (data) {
						if (data.State == 0) {
							alert("Tạo mới báo cáo thành công");
							var datepicker = $("#datepicker").data("kendoDatePicker");
							reloadTimeline(kendo.toString(datepicker.value(), 'dd/MM/yyyy'));
							$("#window").data("kendoWindow").close();
						}
						else alert("Tạo mới báo cáo không thành công");
					},
					error: function (data) {
						alert("Tạo mới thất bại", data.Message);
					}
				});
			}

		}
	}

}
