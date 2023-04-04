
// Lấy danh sách các dòng được chọn
let lstSelectedRow = [];

function onChange(e) {
	lstSelectedRow = [];
	var rows = e.sender.select();
	rows.each(function (e) {
		var grid = $("#grid").data("kendoGrid");
		var dataItem = grid.dataItem(this);
		lstSelectedRow.push(dataItem);
	})

};

function OpenWinDownSua() {

	btnedit = $("#btnedit");
	var myWindowThemMoi = $("#windowThemMoi");

	btnedit.click(function () {
		if (lstSelectedRow.length > 1) {
			alert("Không được sửa nhiều công việc");
		}
		else if (lstSelectedRow.length == 0) {
			alert("Không có công việc nào được chọn");
		}
		else if (!!lstSelectedRow[0].XacNhanGiaoViec) {
			alert("Công việc này đã được người giao việc xác nhận, không thể sửa");
		}
		else {

			isThemCongViec = false;
			$(".k-window-title").text("Sửa công việc giao trực tiếp");
			$("#duAn").val(lstSelectedRow[0].IdDuAn)
			$("#tenCongViec").val(lstSelectedRow[0].TenCongViec);
			$("#tgBatDau").kendoDateTimePicker({
				value: lstSelectedRow[0].KH_BatDau,
				format: "dd/MM/yyyy HH:mm",
				dateInput: true,
				max: new Date(),
			});
						
			$("#tgKetThuc").kendoDateTimePicker({
				value: lstSelectedRow[0].KH_KetThuc,
				format: "dd/MM/yyyy HH:mm",
				dateInput: true
			});
			$("#ngayGiao").kendoDateTimePicker({
				value: lstSelectedRow[0].KH_NgayGiao,
				format: "dd/MM/yyyy HH:mm",
				dateInput: true,
				change: OnChangeDeliveryDate,
				max: new Date(),
			});

			$("#guidCOngViec").val(lstSelectedRow[0].GUID);
			$("#ngGiao").val(lstSelectedRow[0].IdNguoiGiao);
			myWindowThemMoi.data("kendoWindow").open();
		}
	});

}


function SuaCongViecGiaoTrucTiep() {

	var idDA = $("#duAn").val();
	var tenCongViec = $("#tenCongViec").val();
	var ngayGiao = kendo.toString($("#ngayGiao").data("kendoDateTimePicker").value(), "G");
	var tgbd = kendo.toString($("#tgBatDau").data("kendoDateTimePicker").value(), "G");
	var tgkt = kendo.toString($("#tgKetThuc").data("kendoDateTimePicker").value(), "G");
	var idNguoiGiao = $("#ngGiao").val();
	var Guid = $("#guidCOngViec").val();
	if (tenCongViec.length == 0 || ngayGiao == null) {
		alert("Vui lòng điền đầy đủ thông tin");
	}
	else if ($("#ngayGiao").data("kendoDateTimePicker").value() > new Date()) {
		alert("Ngày giao không được lớn hơn ngày hiện tại");
	}
	else if (tgbd >= tgkt) {
		alert("Thời gian kết thúc phải lớn hơn thời gian bắt đầu");
	}
	else {
		$('#btnSave').attr("disabled", true);
		$.ajax({
			type: "POST",
			url: "/ProductDevelopment/QuanLyCongViecNgay/SuaCongViecGiaoTrucTiep",
			data: "{IdDuAn: '" + idDA
				+ "', Guid: '" + Guid
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
				if (data.State == 0) {
					alert("Sửa công việc thành công");
					reLoad();
					$("#windowThemMoi").data("kendoWindow").close();
				}
				else {
					alert(data.Message);
				}
			},
			error: function (data) {
				alert("Sửa thất bại", data.Message);
			},
			complete: function () {
				// enable nut luu
				$('#btnSave').attr("disabled", false);
			}
		});
	}
}
