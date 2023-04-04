using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class BaseControllerMVC : System.Web.Mvc.Controller
    {
        protected Context Context
        {
            get
            {
                return Context.Current;
            }
        }


        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //if (Context.Current.Session.CurrentUserSession == null)
            //{
            //    if (filterContext.Controller is TaiKhoanController && (filterContext.ActionDescriptor.ActionName == "Index" || filterContext.ActionDescriptor.ActionName == "DangNhapHeThong"))
            //    {

            //    }
            //    else
            //    {
            //        filterContext.Result = new RedirectToRouteResult(
            //                           new RouteValueDictionary
            //                           {
            //                                { "controller", "TaiKhoan" },
            //                                { "action", "Index" }
            //                           });
            //        return;
            //    }

            //}
            base.OnActionExecuting(filterContext);
        }




    }


    public partial class Context
    {

        public SessionManager Session { get; private set; }

        private void InitManager()
        {
            this.Session = new SessionManager(this);
        }
        private void AfterInitManager()
        {
            ContextManager.TriggerAfterInit(this.Session);
        }

        public abstract class ContextManager
        {
            public static void TriggerAfterInit(ContextManager self)
            {
                self.AfterInit();
            }

            public Context Context { get; private set; }

            protected ContextManager(Context ctx)
            {
                this.Context = ctx;
                Init();
            }

            protected virtual void Init() { }
            protected virtual void AfterInit() { }
        }

        public partial class SessionManager : ContextManager
        {
            internal SessionManager(Context ctx)
                : base(ctx)
            {
            }
        }

        public static Context Current { get; }

        static Context()
        {
            Current = new Context();
            Current.Setup();
        }

        private IDictionary<string, BaseFactory> Factories { get; }

        private Context()
        {
            InitManager();
            Factories = new Dictionary<string, BaseFactory>();

            var PreloadFactories = typeof(Context).Assembly.GetTypes().Where(t => t.IsClass && !t.IsAbstract && t.IsSubclassOf(typeof(BaseFactory)));
            foreach (var PreloadFactory in PreloadFactories)
            {
                try
                {
                    var instance = Activator.CreateInstance(PreloadFactory) as BaseFactory;
                    Factories[PreloadFactory.Name] = instance;
                    instance.Init();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex);
                }
            }

        }

        private void Setup()
        {
            foreach (var Factory in Factories.Values)
            {
                Factory.Setup();
            }
        }

        /// <summary>
        /// Mở sử dụng 1 Factory với tên cụ thể
        /// </summary>
        /// <typeparam name="T">Kiểu của Factory</typeparam>
        /// <param name="fName">Tên cụ thể của Factory</param>
        /// <returns></returns>
        public T Open<T>(string fName) where T : BaseFactory
        {
            fName = typeof(T).Name;
            if (Factories.ContainsKey(fName))
            {
                return (T)Factories[fName];
            }
            return default(T);
        }

        /// <summary>
        /// Mở sử dụng 1 Factory
        /// </summary>
        /// <typeparam name="T">Kiểu của Factory</typeparam>
        /// <returns></returns>
        public T Open<T>() where T : BaseFactory
        {
            return this.Open<T>(typeof(T).Name);
        }

        public bool isLogin
        {
            get;
            set;
        }

    }

    public abstract class BaseFactory
    {
        protected Context Context
        {
            get
            {
                return Context.Current;
            }
        }

        /// <summary>
        /// Chương trình con thực thi khi khởi tạo Factory
        /// </summary>
        public virtual void Init()
        {

        }

        /// <summary>
        /// Chương trình con thực thi sau khi hoàn tất quá trình khởi tạo tất cả Factories
        /// </summary>
        public virtual void Setup()
        {

        }
    }
}