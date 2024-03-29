﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using XHD.Common;

namespace XHD.CRM.Data
{
    /// <summary>
    /// CRM_Follow 的摘要说明
    /// </summary>
    public class CRM_Follow : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest request = context.Request;

            BLL.CRM_Follow follow = new BLL.CRM_Follow();
            Model.CRM_Follow model = new Model.CRM_Follow();

            BLL.hr_employee emp = new BLL.hr_employee();
            int emp_id = int.Parse(request.Cookies["UserID"].Value);
            DataSet dsemp = emp.GetList("id=" + emp_id);
            string empname = dsemp.Tables[0].Rows[0]["name"].ToString();
            string uid = dsemp.Tables[0].Rows[0]["uid"].ToString();

            if (request["Action"] == "save")
            {
                model.Customer_id = int.Parse(request["cid"]);
                BLL.CRM_Customer ccc = new BLL.CRM_Customer();
                string cname = ccc.GetList("id=" + model.Customer_id).Tables[0].Rows[0]["Customer"].ToString();
                model.Customer_name = PageValidate.InputText(cname, 250);
                model.Follow = PageValidate.InputText(request["T_follow"], 4000);

                model.Follow_Type_id = int.Parse(request["T_followtype_val"]);
                model.Follow_Type = PageValidate.InputText(request["T_followtype"], 255);

                string fid = request["fid"];
                if (!string.IsNullOrEmpty(fid) && fid != "null")
                {
                    DataSet ds = follow.GetList("id=" + int.Parse(fid));
                    DataRow dr = ds.Tables[0].Rows[0];
                    model.employee_id = int.Parse(dr["employee_id"].ToString());
                    model.employee_name = dr["employee_name"].ToString();
                    model.department_id = int.Parse(dr["department_id"].ToString());
                    model.department_name = dr["department_name"].ToString();
                    model.Follow_date = DateTime.Parse(dr["Follow_date"].ToString());
                    model.id = int.Parse(fid);

                    follow.Update(model);

                    //最后跟进
                    ccc.UpdateLastFollow(model.Customer_id.ToString());

                    //日志
                    C_Sys_log log = new C_Sys_log();
                    int UserID = emp_id;
                    string UserName = empname;
                    string IPStreet = request.UserHostAddress;
                    string EventTitle = model.Customer_name;
                    string EventType = "客户跟进修改";
                    int EventID = model.id;

                    if (dr["Follow"].ToString() != request["T_follow"])
                    {
                        log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "跟进内容", "跟进内容被修改", "跟进内容被修改");
                    }
                    if (dr["Follow_Type"].ToString() != request["T_followtype"])
                    {
                        log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "跟进类型", dr["Follow_Type"].ToString(), request["T_followtype"]);
                    }
                }
                else
                {

                    DataRow dr1 = dsemp.Tables[0].Rows[0];
                    model.employee_id = int.Parse(dr1["ID"].ToString());
                    model.employee_name = dr1["name"].ToString();
                    string depid = dr1["d_id"].ToString();
                    if (string.IsNullOrEmpty(depid))
                        depid = "0";
                    model.department_id = int.Parse(depid);
                    model.department_name = dr1["dname"].ToString();

                    model.Follow_date = DateTime.Now;

                    int customerid = follow.Add(model);

                    //最后跟进
                    ccc.UpdateLastFollow(model.Customer_id.ToString());

                }
                if (!string.IsNullOrEmpty(request["T_content"]))
                {
                    BLL.Personal_Calendar calendar = new BLL.Personal_Calendar();
                    Model.Personal_Calendar modelcalendar = new Model.Personal_Calendar();

                    int clientzone = 8;
                    int serverzone = GetTimeZone();
                    var zonediff = serverzone - clientzone;

                    modelcalendar.StartTime = DateTime.Parse(request["T_starttime"]).AddHours(zonediff);
                    modelcalendar.EndTime = DateTime.Parse(request["T_endtime"]).AddHours(zonediff);

                    modelcalendar.Subject = PageValidate.InputText("【" + cname + "】" + request["T_content"], 4000);

                    modelcalendar.emp_id = int.Parse(request.Cookies["UserID"].Value);
                    modelcalendar.UPAccount = request.Cookies["UserID"].Value;
                    modelcalendar.UPTime = DateTime.Now;
                    modelcalendar.MasterId = clientzone;
                    modelcalendar.CalendarType = 1;
                    modelcalendar.InstanceType = 0;
                    modelcalendar.IsAllDayEvent = PageValidate.InputText(request["allday"], 255) == "True" ? true : false;

                    calendar.Add(modelcalendar);
                }
            }

            if (request["Action"] == "form")
            {
                DataSet ds = follow.GetList("id=" + int.Parse( request["fid"]));

                //权限
                DataSet dsauth = DataAuth(ds, request.Cookies["UserID"].Value);

                string dt = Common.DataToJson.DataToJSON(dsauth);

                context.Response.Write(dt);
            }
            //del
            if (request["Action"] == "AdvanceDelete")
            {
                string id = request["id"];
                
                DataSet ds = follow.GetList("id=" + int.Parse(id));

                bool canedel = true;
                if (uid != "admin")
                {
                    Data.GetDataAuth dataauth = new Data.GetDataAuth();
                    string txt = dataauth.GetDataAuthByid("2", "Sys_del", emp_id.ToString());

                    string[] arr = txt.Split(':');
                    switch (arr[0])
                    {
                        case "none":
                            canedel = false;
                            break;
                        case "my":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["employee_id"].ToString() == arr[1])
                                    canedel = true;
                                else
                                    canedel = false;
                            }
                            break;
                        case "dep":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["dep_id"].ToString() == arr[1])
                                    canedel = true;
                                else
                                    canedel = false;
                            }
                            break;
                        case "all":
                            canedel = true;
                            break;
                    }
                }
                if (canedel)
                {
                    bool isdel = follow.AdvanceDelete(int.Parse(request["id"]), 1, DateTime.Now.ToString(StaticStr.yyyy_MM_dd_HH_mm_ss));
                    //context.Response.Write("{success:success}");
                    if (isdel)
                    {
                        //日志
                        string EventType = "跟进预删除";

                        int UserID = emp_id;
                        string UserName = empname;
                        string IPStreet = request.UserHostAddress;
                        int EventID = int.Parse(id);
                        string EventTitle = ds.Tables[0].Rows[0]["Customer_name"].ToString();
                        string Original_txt = null;
                        string Current_txt = null;

                        C_Sys_log log = new C_Sys_log();

                        log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, null, Original_txt, Current_txt);

                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                }
                else
                {
                    context.Response.Write("delfalse");
                }
            }
            //del
            if (request["Action"] == "del")
            {
                bool canDel = false;
                if (dsemp.Tables[0].Rows.Count > 0)
                {
                    if (dsemp.Tables[0].Rows[0]["uid"].ToString() == "admin")
                    {
                        canDel = true;
                    }
                    else
                    {
                        Data.GetAuthorityByUid getauth = new Data.GetAuthorityByUid();
                        string delauth = getauth.GetBtnAuthority(request.Cookies["UserID"].Value, "64");
                        if (delauth == "false")
                            canDel = false;
                        else
                            canDel = true;
                    }
                }
                if (canDel)
                {
                    string idlist = PageValidate.InputText( request["idlist"],100000);
                    string[] arr = idlist.Split(',');

                    DataSet ds = follow.GetList("id in (" + idlist.Trim() + ")");

                    for (int i = 0; i < arr.Length; i++)
                    {
                        follow.Delete(int.Parse(arr[i]));
                    }

                    if (true)
                    {
                        string EventType = "彻底删除跟进";


                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            int UserID = emp_id;
                            string UserName = empname;
                            int EventID = idlist[i];
                            string IPStreet = request.UserHostAddress;
                            string EventTitle = ds.Tables[0].Rows[i]["Customer_name"].ToString();
                            string Original_txt = null;
                            string Current_txt = null;

                            C_Sys_log log = new C_Sys_log();
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, null, Original_txt, Current_txt);
                        }

                        context.Response.Write("true");
                    }                  
                }
                else
                {
                    context.Response.Write("auth");
                }

            }
            //regain  


            //需要加2
            if (request["Action"] == "regain")
            {
                string idlist = PageValidate.InputText( request["idlist"],10000);
                string[] arr = idlist.Split(',');

                DataSet ds = follow.GetList("id in (" + idlist.Trim() + ")");


                bool canedel = true;
                if (uid != "admin")
                {
                    Data.GetDataAuth dataauth = new Data.GetDataAuth();
                    string txt = dataauth.GetDataAuthByid("2", "Sys_del", emp_id.ToString());

                    string[] arr1 = txt.Split(':');
                    switch (arr1[0])
                    {
                        case "none":
                            canedel = false;
                            break;
                        case "my":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["employee_id"].ToString() == arr1[1])
                                    canedel = true;
                                else
                                    canedel = false;
                            }
                            break;
                        case "dep":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["department_id"].ToString() == arr1[1])
                                    canedel = true;
                                else
                                    canedel = false;
                            }
                            break;
                        case "all":
                            canedel = true;
                            break;
                    }
                }
                if (canedel)
                {
                    for (int i = 0; i < arr.Length; i++)
                    {
                        follow.AdvanceDelete(int.Parse(arr[i]), 0, DateTime.Now.ToString(StaticStr.yyyy_MM_dd_HH_mm_ss));
                    }

                    if (true)
                    {
                        //日志

                        string EventType = "恢复删除跟进"; 

                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            int UserID = emp_id;
                            string UserName = empname;
                            int EventID = idlist[i];
                            string IPStreet = request.UserHostAddress;
                            string EventTitle = ds.Tables[0].Rows[i]["Customer_name"].ToString();
                            string Original_txt = null;
                            string Current_txt = null;

                            C_Sys_log log = new C_Sys_log();
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, null, Original_txt, Current_txt);
                        }

                        context.Response.Write("true");
                    }                        
                }
                else
                {

                    context.Response.Write("delfalse");
                }

            }
            //serch
            if (request["Action"] == "grid")
            {
                int PageIndex = int.Parse(request["page"] == null ? "1" : request["page"]);
                int PageSize = int.Parse(request["pagesize"] == null ? "30" : request["pagesize"]);
                string sortname = request["sortname"];
                string sortorder = request["sortorder"];

                if (string.IsNullOrEmpty(sortname))
                    sortname = " Follow_date";
                if (string.IsNullOrEmpty(sortorder))
                    sortorder = "desc";

                string sorttext = " " + sortname + " " + sortorder;

                string Total;

                string serchtxt = null;

                //is delete ?
                if (request["isdel"] == "1")
                    serchtxt += " ISNULL(isDelete,0)=1 ";
                else
                    serchtxt += " ISNULL(isDelete,0)=0 ";   

                if (!string.IsNullOrEmpty(request["customer_id"]))
                    serchtxt += " and Customer_id=" + int.Parse(request["customer_id"]);

                if (!string.IsNullOrEmpty(request["company"]))
                    serchtxt += " and Customer_name like N'%" + PageValidate.InputText( request["company"] ,255)+ "%'";

                if (!string.IsNullOrEmpty(request["department"]))
                    serchtxt += " and department_id = " + int.Parse(request["department_val"]);

                if (!string.IsNullOrEmpty(request["employee"]))
                    serchtxt += " and employee_id = " + int.Parse( request["employee_val"]);

                if (!string.IsNullOrEmpty(request["followtype"]))
                    serchtxt += " and Follow_Type_id = " + int.Parse( request["followtype_val"]);

                if (!string.IsNullOrEmpty(request["startdate"]))
                    serchtxt += " and Follow_date >= '" + PageValidate.InputText( request["startdate"],255) + "'";

                if (!string.IsNullOrEmpty(request["enddate"]))
                {
                    DateTime enddate = DateTime.Parse(request["enddate"]).AddHours(23).AddMinutes(59).AddSeconds(59);
                    serchtxt += " and Follow_date  <= '" + enddate + "'";
                }

                if (!string.IsNullOrEmpty(request["startdate_del"]))
                    serchtxt += " and Delete_time >= '" + PageValidate.InputText( request["startdate_del"],255) + "'";

                if (!string.IsNullOrEmpty(request["enddate_del"]))
                {
                    DateTime enddate = DateTime.Parse(request["enddate_del"]).AddHours(23).AddMinutes(59).AddSeconds(59);
                    serchtxt += " and Delete_time  <= '" + enddate + "'";
                }
                if (!string.IsNullOrEmpty(request["T_smart"]))
                {
                    if (request["T_smart"] != "输入关键词智能搜索跟进内容")
                        serchtxt += " and Follow like N'%" + PageValidate.InputText( request["T_smart"],255) + "%'";
                }
                DataSet ds = follow.GetList(PageSize, PageIndex, serchtxt, sorttext, out Total);

                //权限
                DataSet dsauth = DataAuth(ds, emp_id.ToString());
                string dt = Common.GetGridJSON.DataTableToJSON1(dsauth.Tables[0], Total);
                context.Response.Write(dt);
            }

            if (request["Action"] == "Compared_follow")
            {
                string dt1 = request["date1"];
                string dt2 = request["date2"];

                DataSet ds = follow.Compared_follow(DateTime.Parse(dt1), DateTime.Parse(dt2));

                string dt = GetGridJSON.DataTableToJSON(ds.Tables[0]);
                context.Response.Write(dt);
            }

            if (request["Action"] == "Compared_empcusfollow")
            {
                var idlist = PageValidate.InputText( request["idlist"].Replace(";", ",").Replace("-", ""),100000);
                string dt1 = request["date1"];
                string dt2 = request["date2"];

                BLL.hr_post post = new BLL.hr_post();
                DataSet dspost = post.GetList("post_id in(" + idlist + ")");

                string emplist = "(";

                for (int i = 0; i < dspost.Tables[0].Rows.Count - 1; i++)
                {
                    emplist += dspost.Tables[0].Rows[i]["emp_id"] + ",";
                }
                emplist += dspost.Tables[0].Rows[dspost.Tables[0].Rows.Count - 1]["emp_id"] + ")";

                //context.Response.Write(emplist);

                DataSet ds = follow.Compared_empcusfollow(DateTime.Parse(dt1), DateTime.Parse(dt2), emplist);

                string dt = Common.GetGridJSON.DataTableToJSON(ds.Tables[0]);
                context.Response.Write(dt);
            }

            if (request["Action"] == "emp_cusfollow")
            {
                var idlist = PageValidate.InputText( request["idlist"].Replace(";", ",").Replace("-", ""),1000000);
                var syear = request["syear"];

                BLL.hr_post post = new BLL.hr_post();
                DataSet dspost = post.GetList("post_id in(" + idlist + ")");

                string emplist = "(";

                for (int i = 0; i < dspost.Tables[0].Rows.Count - 1; i++)
                {
                    emplist += dspost.Tables[0].Rows[i]["emp_id"] + ",";
                }
                emplist += dspost.Tables[0].Rows[dspost.Tables[0].Rows.Count - 1]["emp_id"] + ")";

                //context.Response.Write(emplist);

                DataSet ds = follow.report_empfollow(int.Parse(syear), emplist);

                string dt = Common.GetGridJSON.DataTableToJSON(ds.Tables[0]);
                context.Response.Write(dt);
            }


        }

        private DataSet DataAuth(DataSet ds, string uid)
        {
            BLL.hr_employee emp = new BLL.hr_employee();
            DataSet dsemp = emp.GetList("ID=" + int.Parse( uid));

            //权限

            if (dsemp.Tables[0].Rows.Count > 0)
            {
                if (dsemp.Tables[0].Rows[0]["uid"].ToString() != "admin")
                {
                    Data.GetDataAuth dataauth = new Data.GetDataAuth();
                    string txt = dataauth.GetDataAuthByid("2", "Sys_view", uid);

                    string[] arr = txt.Split(':');
                    switch (arr[0])
                    {
                        case "none": ds.Tables[0].Rows.Clear();
                            break;
                        case "my":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["employee_id"].ToString() != arr[1])
                                {
                                    ds.Tables[0].Rows[i]["Follow"] = "---";
                                }
                            }
                            break;
                        case "dep":
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (ds.Tables[0].Rows[i]["department_id"].ToString() != arr[1])
                                {
                                    ds.Tables[0].Rows[i]["Follow"] = "---";
                                }
                            }
                            break;
                    }
                }
            }
            return ds;
        }
        private static int GetTimeZone()
        {
            DateTime now = DateTime.Now;
            var utcnow = now.ToUniversalTime();

            var sp = now - utcnow;

            return sp.Hours;
        }
        private static long MilliTimeStamp(DateTime theDate)
        {
            DateTime d1 = new DateTime(1970, 1, 1);
            DateTime d2 = theDate.ToUniversalTime();
            TimeSpan ts = new TimeSpan(d2.Ticks - d1.Ticks);
            return (long)ts.TotalMilliseconds;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}