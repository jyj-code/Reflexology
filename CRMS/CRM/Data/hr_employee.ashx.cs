﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Web.Security;
using System.Web.Script.Serialization;
using XHD.Common;

namespace XHD.CRM.Data
{
    /// <summary>
    /// hr_employee 的摘要说明
    /// </summary>
    public class hr_employee : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpRequest request = context.Request;

            BLL.hr_employee emp = new BLL.hr_employee();
            Model.hr_employee model = new Model.hr_employee();
            int emp_id = int.Parse(request.Cookies["UserID"].Value.ToString());
            DataSet dsemp = emp.GetList("id=" + emp_id);

            string empname = dsemp.Tables[0].Rows[0]["name"].ToString();
            string uid = dsemp.Tables[0].Rows[0]["uid"].ToString();

            if (request["Action"] == "grid")
            {
                int PageIndex = int.Parse(request["page"] == null ? "1" : request["page"]);
                int PageSize = int.Parse(request["pagesize"] == null ? "30" : request["pagesize"]);
                string sortname = request["sortname"];
                string sortorder = request["sortorder"];

                if (string.IsNullOrEmpty(sortname))
                    sortname = " ID";
                if (string.IsNullOrEmpty(sortorder))
                    sortorder = " desc";

                string sorttext = " " + sortname + " " + sortorder;

                string Total;
                string serchtxt = "uid!='admin'";
                string serchtype = request["isdel"];
                if (serchtype == "1")
                {
                    serchtxt += " and ISNULL(isDelete,0)=1";
                }
                else
                {
                    serchtxt += " and ISNULL(isDelete,0)=0 ";
                }


                if (!string.IsNullOrEmpty(request["stext"]))
                {
                    if (request["stext"] != "输入姓名搜索")
                        serchtxt += " and name like N'%" + PageValidate.InputText(request["stext"], 255) + "%'";
                }
                //权限
                DataSet ds = emp.GetList(PageSize, PageIndex, serchtxt, sorttext, out Total);

                string dt = Common.GetGridJSON.DataTableToJSON1(ds.Tables[0], Total);
                context.Response.Write(dt);
            }    

            //validate
            if (request["Action"] == "Exist")
            {   
                DataSet ds1 = emp.GetList(" uid='" + Common.PageValidate.InputText(request["T_uid"], 250) + "' ");

                context.Response.Write(ds1.Tables[0].Rows.Count > 0 ? "false" : "true");

            }

            //Form JSON
            if (request["Action"] == "form")
            {

                string eid = request["id"];
                if (!string.IsNullOrEmpty(eid))
                {
                    DataSet ds = emp.GetList("id=" + (Common.PageValidate.IsNumber(eid) ? eid : "-1"));

                    string dt = Common.DataToJson.DataToJSON(ds);

                    context.Response.Write(dt);
                }
            }
            //save
            if (request["Action"] == "save")
            { 
                    model.uid = Common.PageValidate.InputText(request["T_uid"], 255);
                    model.email = Common.PageValidate.InputText(request["T_email"], 255);
                    model.name = Common.PageValidate.InputText(request["T_name"], 255);
                    model.birthday = Common.PageValidate.InputText(request["T_birthday"], 255);
                    model.sex = Common.PageValidate.InputText(request["T_sex"], 255);
                    model.idcard = Common.PageValidate.InputText(request["T_idcard"], 255);
                    model.tel = Common.PageValidate.InputText(request["T_tel"], 255);
                    model.status = Common.PageValidate.InputText(request["T_status"], 255);
                    model.EntryDate = Common.PageValidate.InputText(request["T_entryDate"], 255);
                    model.address = Common.PageValidate.InputText(request["T_Adress"], 255);
                    model.schools = Common.PageValidate.InputText(request["T_school"], 255);
                    model.education = Common.PageValidate.InputText(request["T_edu"], 255);
                    model.professional = Common.PageValidate.InputText(request["T_professional"], 255);
                    model.remarks = Common.PageValidate.InputText(request["T_remarks"], 255);
                    model.title = Common.PageValidate.InputText(request["headurl"], 255);
                    model.canlogin = int.Parse(request["canlogin"]);



                    int empid;
                    string id = request["id"];
                    if (!string.IsNullOrEmpty(id) && id != "null")
                    {
                        DataSet ds = emp.GetList(" ID=" + int.Parse(id));
                        DataRow dr = ds.Tables[0].Rows[0];
                        model.ID = int.Parse(id);
                        empid = model.ID;


                        emp.Update(model);


                        C_Sys_log log = new C_Sys_log();

                        int UserID = emp_id;
                        string UserName = empname;
                        string IPStreet = request.UserHostAddress;
                        string EventTitle = model.name;
                        string EventType = "员工修改";
                        int EventID = model.ID;

                        if (dr["email"].ToString() != request["T_email"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "邮箱", dr["email"].ToString(), request["T_email"]);
                        }
                        if (dr["name"].ToString() != request["T_name"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "员工姓名", dr["name"].ToString(), request["T_name"]);
                        }
                        if (dr["birthday"].ToString() != request["T_birthday"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "员工生日", dr["birthday"].ToString(), request["T_birthday"]);
                        }
                        if (dr["sex"].ToString() != request["T_sex"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "员工性别", dr["sex"].ToString(), request["T_sex"]);
                        }
                        if (dr["status"].ToString() != request["T_status"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "状态", dr["status"].ToString(), request["T_status"]);
                        }
                        if (dr["idcard"].ToString() != request["T_idcard"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "身份证", dr["idcard"].ToString(), request["T_idcard"]);
                        }
                        if (dr["tel"].ToString() != request["T_tel"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "手机", dr["tel"].ToString(), request["T_tel"]);
                        }
                        if (dr["EntryDate"].ToString() != request["T_entryDate"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "入职日期", dr["EntryDate"].ToString(), request["T_entryDate"]);
                        }
                        if (dr["address"].ToString() != request["T_Adress"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "地址", dr["address"].ToString(), request["T_Adress"]);
                        }
                        if (dr["schools"].ToString() != request["T_school"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "毕业学校", dr["schools"].ToString(), request["T_school"]);
                        }
                        if (dr["education"].ToString() != request["T_edu"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "学历", dr["education"].ToString(), request["T_edu"]);
                        }
                        if (dr["professional"].ToString() != request["T_professional"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "专业", dr["professional"].ToString(), request["T_professional"]);
                        }
                        if (dr["remarks"].ToString() != request["T_remarks"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "备注", dr["remarks"].ToString(), request["T_remarks"]);
                        }
                        if (dr["canlogin"].ToString() != request["canlogin"])
                        {
                            log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "能否登录", dr["canlogin"].ToString(), request["canlogin"]);
                        }
                        //if (dr["headimages"].ToString() != request["headurl"])
                        //{
                        //    log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, "形象照", dr["headimages"].ToString(), request["headurl"]);
                        //}

                        context.Response.Write(id + "|" + model.name);
                    }
                    else
                    {
                        model.pwd = FormsAuthentication.HashPasswordForStoringInConfigFile("123456", "MD5");
                        empid = emp.Add(model);
                        context.Response.Write("{success:success}");
                    }

                    //post
                    string json = request["PostData"].ToLower();
                    JavaScriptSerializer js = new JavaScriptSerializer();

                    PostData[] postdata;
                    postdata = js.Deserialize<PostData[]>(json);

                    BLL.hr_post hp = new BLL.hr_post();
                    Model.hr_post modelpost = new Model.hr_post();

                    modelpost.emp_id = empid;
                    model.ID = empid;
                    modelpost.emp_name = Common.PageValidate.InputText(request["T_name"], 255);

                    for (int i = 0; i < postdata.Length; i++)
                    {
                        modelpost.post_id = postdata[i].Post_id;
                        modelpost.default_post = postdata[i].Default_post;

                        if (postdata[i].Default_post == 1)
                        {
                            model.d_id = postdata[i].dep_id;
                            model.dname = postdata[i].Depname;
                            model.zhiwuid = postdata[i].Position_id;
                            model.zhiwu = postdata[i].Position_name;
                            model.postid = postdata[i].Post_id;
                            model.post = postdata[i].Post_name;
                            //context.Response.Write(postdata[i].Depname + "@");
                            emp.UpdatePost(model);
                        }

                        hp.UpdatePostEmp(modelpost);
                        //context.Response.Write("{success:success}");
                    }
                } 

            //combo
            if (request["Action"] == "combo")
            {
                string did = request["did"];
                if (!string.IsNullOrEmpty(did))
                {
                    DataSet ds = emp.GetList(" ISNULL(isDelete,0)=0 and d_id=" + (Common.PageValidate.IsNumber(did) ? did : "-1"));

                    StringBuilder str = new StringBuilder();

                    str.Append("[");
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        str.Append("{id:" + ds.Tables[0].Rows[i]["id"].ToString() + ",text:'" + ds.Tables[0].Rows[i]["name"] + "'},");
                    }
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");

                    context.Response.Write(str);
                }
            }
            //init
            if (request["Action"] == "init")
            {

                DataSet ds = emp.GetList(" ISNULL(isDelete,0)=0 and ID=" + emp_id);

                StringBuilder str = new StringBuilder();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    str.Append(ds.Tables[0].Rows[0]["ID"].ToString() + "|" + ds.Tables[0].Rows[0]["d_id"]);
                }


                context.Response.Write(str);
            }
            //changepwd
            if (request["Action"] == "changepwd")
            {

                DataSet ds = emp.GetPWD(emp_id);

                string oldpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(request["T_oldpwd"], "MD5");
                string newpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(request["T_newpwd"], "MD5");

                if (ds.Tables[0].Rows[0]["pwd"].ToString() == oldpwd)
                {
                    model.pwd = newpwd;
                    model.ID = int.Parse(request.Cookies["UserID"].Value);
                    emp.changepwd(model);
                    context.Response.Write("true");
                }
                else
                {
                    context.Response.Write("false");
                }
            }

            //allchangepwd
            if (request["Action"] == "allchangepwd")
            {
                string empid = request["empid"];


                string newpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(request["T_newpwd"], "MD5");

                model.pwd = newpwd;
                model.ID = int.Parse(empid);
                emp.changepwd(model);



            }
            //del
            if (request["Action"] == "AdvanceDelete")
            {

                BLL.hr_post hp = new BLL.hr_post();
                string empid = request["id"];

                string EventType = "员工预删除";

                DataSet ds = emp.GetList(" id=" + int.Parse(empid));

                bool isdel = false;
                if (!string.IsNullOrEmpty(empid))
                {
                    if (Common.PageValidate.IsNumber(empid))
                    {
                        isdel = emp.AdvanceDelete(int.Parse(request["id"]), 1, DateTime.Now.ToString(StaticStr.yyyy_MM_dd_HH_mm_ss));
                        //update post
                        hp.UpdatePostEmpbyEid(int.Parse(empid));
                    }
                }

                if (isdel)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        int UserID = emp_id;
                        string UserName = empname;
                        string IPStreet = request.UserHostAddress;
                        int EventID = int.Parse(empid);
                        string EventTitle = ds.Tables[0].Rows[i]["name"].ToString();
                        string Original_txt = null;
                        string Current_txt = null;
                        C_Sys_log log = new C_Sys_log();
                        log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, null, Original_txt, Current_txt);
                    }
                    context.Response.Write("true");
                }
                else
                {
                    context.Response.Write("false");
                }
            }

            if (request["Action"] == "regain")
            {
                string idlist = PageValidate.InputText( request["idlist"],100000);
                string[] arr = idlist.Split(',');

                DataSet ds = emp.GetList("ID in (" + idlist.Trim() + ")");

                for (int i = 0; i < arr.Length; i++)
                {
                    emp.AdvanceDelete(int.Parse(arr[i]), 0, DateTime.Now.ToString(StaticStr.yyyy_MM_dd_HH_mm_ss));
                }

                if (true)
                {
                    //日志

                    string EventType = "恢复删除员工";


                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        int UserID = emp_id;
                        string UserName = empname;
                        int EventID = idlist[i];
                        string IPStreet = request.UserHostAddress;
                        string EventTitle = ds.Tables[0].Rows[i]["name"].ToString();
                        string Original_txt = null;
                        string Current_txt = null;

                        C_Sys_log log = new C_Sys_log();
                        log.Add_log(UserID, UserName, IPStreet, EventTitle, EventType, EventID, null, Original_txt, Current_txt);
                    }

                    context.Response.Write("true");
                }
                else
                {

                    context.Response.Write("false");
                }
            }

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
                        string delauth = getauth.GetBtnAuthority(request.Cookies["UserID"].Value, "84");
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

                    string EventType = "彻底删除员工";

                    DataSet ds = emp.GetList("id in (" + idlist.Trim() + ")");

                    for (int i = 0; i < arr.Length; i++)
                    {
                        emp.Delete(int.Parse(arr[i]));
                    }

                    if (true)
                    {
                        //日志    
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            int UserID = emp_id;
                            string UserName = empname;
                            string IPStreet = request.UserHostAddress;
                            int EventID = idlist[i];
                            string EventTitle = ds.Tables[0].Rows[0]["name"].ToString();
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
        }
        public class PostData
        {
            private int post_id;
            private string post_name;
            private int? emp_id;
            private string emp_name;
            private int? default_post;
            private int? _dep_id;

            public int? dep_id
            {
                get { return _dep_id; }
                set { _dep_id = value; }
            }
            private string depname;
            private int? position_id;
            private string position_name;

            public int Post_id
            {
                get { return post_id; }
                set { post_id = value; }
            }
            public string Post_name
            {
                get { return post_name; }
                set { post_name = value; }
            }
            public int? Emp_id
            {
                get { return emp_id; }
                set { emp_id = value; }
            }
            public string Emp_name
            {
                get { return emp_name; }
                set { emp_name = value; }
            }
            public int? Default_post
            {
                get { return default_post; }
                set { default_post = value; }
            }

            public string Depname
            {
                get { return depname; }
                set { depname = value; }
            }
            public int? Position_id
            {
                get { return position_id; }
                set { position_id = value; }
            }
            public string Position_name
            {
                get { return position_name; }
                set { position_name = value; }
            }

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