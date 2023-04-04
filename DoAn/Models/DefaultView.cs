using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn.Models
{
    public class DefaultView
    {
        public enum DataState
        {
            /// <summary>
            /// Thành công
            /// </summary>
            Success,

            /// <summary>
            /// Lỗi
            /// </summary>
            Error,
        }

        /// <summary>
        /// Trạng thái của truy vấn.
        /// </summary>
        [JsonConverter(typeof(StringEnumConverter))]
        public DataState State { get; set; }

        /// <summary>
        /// Thông tin phản hồi truy vấn.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Danh sách lỗi
        /// </summary>
        public List<string> Errors { get; set; } = new List<string>();

        /// <summary>
        /// TransactionGuid - Id phiên thao tác dữ liệu
        /// See more in Context.Current.Transaction
        /// </summary>
        public Guid TransactionGuid { get; internal set; }

        /// <summary>
        /// Dữ liệu bổ sung khi cần thiết
        /// </summary>
        public Dictionary<string, object> Extra { get; set; }

        /// <summary>
        /// Exception property avaiable for DEBUGGER
        /// </summary>
#if DEBUG
        public string ExceptionText { get => "" + Exception; }
        public Exception Exception { private get; set; }
#else
        public string ExceptionText { get => ""; }
        public Exception Exception { private get; set; }
#endif
    }

    public class ObjectView<T> : DefaultView
    {
        /// <summary>
        /// Kiểu dữ liệu của đối tượng.
        /// </summary>
        public string DataType
        {
            get
            {
                return typeof(T).ToString();
            }
        }

        /// <summary>
        /// Đối tượng dữ liệu cần trả về.
        /// </summary>
        public T Data { get; set; }

        public string redirectTo { get; set; }
    }
}