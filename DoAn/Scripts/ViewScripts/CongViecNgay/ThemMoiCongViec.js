

function openWindownTaoMoi() {

	var myWindowThemMoi = $("#windowThemMoi");
	btnadd = $("#btnadd");
	myWindowThemMoi.kendoWindow({
		width: "800px",
		height: "380px",
		title: "Thêm công việc giao trực tiếp",
		visible: false,
		resizable: false,
		actions: [
			"Close"
		]
	}).data("kendoWindow").center();

	btnadd.click(function () {

		isThemCongViec = true;
		$(".k-window-title").text("Thêm công việc giao trực tiếp");

		$("#duAn").select(0);
		$("#tenCongViec").val("");
		$("#tgBatDau").kendoDateTimePicker({
			value: new Date(),
			//change: OnChangeDeliveryDate,
			format: "dd/MM/yyyy HH:mm",
			dateInput: true,
			max: new Date(),
		});
		$("#tgKetThuc").kendoDateTimePicker({
			value: new Date(),
			format: "dd/MM/yyyy HH:mm",
			dateInput: true,
		});
		$("#ngayGiao").kendoDateTimePicker({
			value: new Date(),
			format: "dd/MM/yyyy HH:mm",
			dateInput: true,
			change: OnChangeDeliveryDate,
			max: new Date(),
		});
		$("#ngGiao").select(0);

		myWindowThemMoi.data("kendoWindow").open();
	});

	$("#duAn").kendoDropDownList();
	LoadDuAn();


	$("#ngGiao").kendoDropDownList();
	LoadNguoiGiao();


	$("#huy").kendoButton();

}
function LoadDuAn() {
	var lstData;

	$.ajax({
		url: "/ProductDevelopment/QuanLyCongViecNgay/DanhSachDuAn",
		type: "GET",
		async: false,
		dataType: 'json',
		success: function (data) {
			lstData = data.Data;
		},
		error: function (data) {
			console.log(data.Message);
			lstData = null;
		}
	});

	$("#duAn").kendoDropDownList({
		dataSource: lstData,
		dataTextField: "TenDuAn",
		dataValueField: "IdDuAn",
	});

	$("#duAn").data("kendoDropDownList").select(0);
}

function LoadNguoiGiao() {
	var lstData;

	$.ajax({
		url: "/ProductDevelopment/QuanLyCongViecNgay/DanhSachNguoiGiao",
		type: "GET",
		async: false,
		dataType: 'json',
		success: function (data) {
			lstData = data.Data;
		},
		error: function (data) {
			console.log(data.Message);
			lstData = null;
		}
	});

	$("#ngGiao").kendoDropDownList({
		dataSource: lstData,
		dataTextField: "HoTen",
		dataValueField: "UserId",
		//change: reLoad
	});

	$("#ngGiao").data("kendoDropDownList").select(0);
}

function OnChangeDeliveryDate(e) {
	var dtpBatDau = $("#tgBatDau").data("kendoDateTimePicker");
	var dtpngayGiao = $("#ngayGiao").data("kendoDateTimePicker");
	var NgayGiao = dtpngayGiao.value();
	var NgayBD = dtpBatDau.value();
	if (!NgayGiao) {
		alert("Ngày giao việc không được lớn hơn ngày hiện tại");

		dtpBatDau.min(new Date());
		//	dtpBatDau.value(new Date());
	}
	else {
		dtpBatDau.min(dtpngayGiao.value());
		//dtpBatDau.value(dtpngayGiao.value());
	}
	if (!NgayBD) {
		alert("Thời gian bắt đầu không được nhỏ hơn ngày giao");
		//dtpBatDau.value(dtpngayGiao.value());
		//dtpBatDau.min(new Date());


	}

}
function ThemCongViecGiaoTrucTiep() {
	var btnSave = $("#btnSave");
	var idDA = $("#duAn").val();
	var tenCongViec = $("#tenCongViec").val();
	var ngayGiao = kendo.toString($("#ngayGiao").data("kendoDateTimePicker").value(), "G");
	var tgbd = kendo.toString($("#tgBatDau").data("kendoDateTimePicker").value(), "G");
	var tgkt = kendo.toString($("#tgKetThuc").data("kendoDateTimePicker").value(), "G");
	var idNguoiGiao = $("#ngGiao").val();

	if (tenCongViec.length == 0 || ngayGiao == null) {
		alert("Vui lòng điền đầy đủ thông tin");
	}
	else if (tgbd < ngayGiao) {
		alert("Ngày bắt đầu không được nhỏ hơn ngày giao");
	}
	else if (tgbd >= tgkt) {
		alert("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
	}
	else {

		// disable nut luu
		$('#btnSave').attr("disabled", true);
		$.ajax({
			type: "POST",
			url: "/ProductDevelopment/QuanLyCongViecNgay/ThemCongViecGiaoTrucTiep",
			data: "{IdDuAn: '" + idDA
				+ "', TenCongViec: '" + tenCongViec
				+ "', ThoiGianBatDau: '" + tgbd
				+ "', ThoiGianKetThuc: '" + tgkt
				+ "', NgayGiao: '" + ngayGiao
				+ "', idNguoiGiao: '" + idNguoiGiao + "'}"
			,
			async: false,
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (data) {
				if (data.State == 0 && data.Data) {

					alert("Tạo mới công việc thành công");

					$("#windowThemMoi").data("kendoWindow").close();
					reLoad();
				}
				else {
					alert(data.Message);
				}
			},
			error: function (data) {
				alert("Tạo mới thất bại", data.Message);
			},
			complete: function () {
				// enable nut luu
				$('#btnSave').attr("disabled", false);
			}
		});
	}



}

