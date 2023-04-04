
function ExportFile() {
	if (lstSelectedRow.length == 0) {
		alert("Không có công việc nào được chọn");
	}
	else {

		var rows = [{
			cells: [
				{ value: "STT" },
				{ value: "Tên dự án" },
				{ value: "Tên công việc" },
				{ value: "Ngày giao" },
				{ value: "Deadline" },
				{ value: "Trạng thái" }
			]
		}];

		for (var i = 0; i < lstSelectedRow.length; i++) {
			// Push single row for every record.
			rows.push({
				cells: [
					{ value: i + 1 },
					{ value: lstSelectedRow[i].TenDuAn },
					{ value: lstSelectedRow[i].TenCongViec },
					{ value: lstSelectedRow[i].NgayGiao },
					{ value: lstSelectedRow[i].KH_ThoiGianKetThuc },
					{ value: lstSelectedRow[i].TenTrangThai }
				]
			})
		}

		console.log(rows);
		var workbook = new kendo.ooxml.Workbook({
			sheets: [
				{
					columns: [
						// Column settings (width).
						{ autoWidth: true },
						{ autoWidth: true },
						{ autoWidth: true },
						{ autoWidth: true },
						{ autoWidth: true },
						{ autoWidth: true }
					],
					// The title of the sheet.
					title: "DanhSach",
					// The rows of the sheet.
					rows: rows
				}
			]
		});
		// Save the file as an Excel file with the xlsx extension.
		kendo.saveAs({ dataURI: workbook.toDataURL(), fileName: "Danh_sach_Cong_Viec_Duoc_Giao.xlsx" });
	}

}
